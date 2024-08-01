-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
-- More information: https://github.com/MWSE/MWSE/tree/master/docs

--- @meta
--- Provides support for interacting with yaml data, through the yaml-cpp library. The interface is a direct copy of the one found in OpenMW, to ensure compatibility. YAML is not recommended for any use outside of OpenMW compatibility.
--- @class yamllib
yaml = {}

--- Decode string representing yaml into a table.
--- @param input string The string to be decoded into a table.
--- @return table result The decoded table.
function yaml.decode(input) end

--- Loads a yaml file from `path`, using `yaml.decode`. Unlike the related `json.loadfile` function, this is relative to the current working directory, and not relative to Data Files\MWSE. A file extension should be part of the `path` string.
--- @param path string The file to write to, relative to the current working directory (typically the Morrowind installation folder).
--- @return table? data The decoded data, or `nil` if the file could not be found.
--- @return table? error Information about why the yaml file could not be decoded. This result will only be given if the operation fails.
function yaml.loadFile(path) end

