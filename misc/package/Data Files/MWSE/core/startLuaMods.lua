local logger = require("logging.logger")
local dependencyManagerModule = require("Metadata.DependencyManager")

local function execLuaMod(runtime)
	local prefix = runtime.legacy_mod and "mod_init" or "main"
	mwse.log("Running: %s", runtime.key .. "." .. prefix)
	local result, err = pcall(dofile, runtime.key .. "." .. prefix)
	if (not result) then
		mwse.log("[LuaManager] ERROR: Failed to run mod initialization script:")
		mwse.log(err)
		runtime.run = false
		return
	end

	runtime.run = true

	-- Check for dependencies if we need to.
	if (runtime.metadata and runtime.metadata.dependencies) then
		-- Generate a name from the key if we need one.
		local name = runtime.package and runtime.package.name
		if (not name) then
			name = runtime.key
		end

		-- Setup our dependencies.
		local dependencyManager = dependencyManagerModule.new({
			metadata = runtime.metadata,
			logger = logger.new({ name = name, logLevel = "INFO" }),
		})

		-- Actually check the dependencies.
		if (runtime.wait_until_initialize) then
			dependencyManager:checkDependencies()
		else
			event.register(tes3.event.initialized, function()
				dependencyManager:checkDependencies()
			end)
		end
	end
end

local function execLuaModWrapper(runtime)
	if (runtime.wait_until_initialize) then
		mwse.log("Delaying execution of mod %s until initialization.", runtime.key)
		event.register(tes3.event.initialized, function()
			execLuaMod(runtime)
		end, { priority = runtime.load_order })
	else
		execLuaMod(runtime)
	end
end

local function modSorter(a, b)
	-- Core mods go first.
	if (a.core_mod ~= b.core_mod) then
		return a.core_mod
	end

	-- Legacy mods go last.
	if (a.legacy_mod ~= b.legacy_mod) then
		return b.legacy_mod
	end

	-- Then we sort by explicit load order.
	if (a.load_order ~= b.load_order) then
		return a.load_order > b.load_order
	end

	-- Finally we default to the original std::filesystem order.
	return a.std_order < b.std_order
end

-- Gather a list of mods to execute.
local runtimes = table.values(mwse.activeLuaMods) --- @diagnostic disable-line

-- Figure out some common data from the metadata.
for _, runtime in ipairs(runtimes) do
	local metadata = runtime.metadata or {}
	local metadata_tools = metadata.tools or {}
	local metadata_tools_mwse = metadata_tools.mwse or {}

	runtime.load_order = metadata_tools_mwse.load_order or 0
	runtime.wait_until_initialize = metadata_tools_mwse.wait_until_initialize or false
end

-- Sort them as appropriate.
table.sort(runtimes, modSorter)

-- And finally run them.
for _, runtime in ipairs(runtimes) do
	execLuaModWrapper(runtime)
end
