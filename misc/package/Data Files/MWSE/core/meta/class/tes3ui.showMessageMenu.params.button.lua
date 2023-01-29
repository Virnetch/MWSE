-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
-- More information: https://github.com/MWSE/MWSE/tree/master/docs

--- @meta
--- Layout for the buttons table passed to `tes3ui.showMessageMenu` function.
--- @class tes3ui.showMessageMenu.params.button
--- @field callback fun(callbackParams: table) The function to call when this button is clicked.
--- @field enableRequirements fun(callbackParams: table): boolean|nil Function that, if provided, determines whether the button will call the callback when clicked, or be disabled + greyed out. This function will be passed the `callbackParams` table that was provided in `tes3ui.showMessageMenu`.
--- @field showRequirements fun(callbackParams: table): boolean|nil If set, the button will only be visible if this function returns true. This function will be passed the `callbackParams` table that was provided in `tes3ui.showMessageMenu`.
--- @field text string **Required.** The label on the button.
--- @field tooltip tes3ui.showMessageMenu.params.tooltip|fun(callbackParams: table): tes3ui.showMessageMenu.params.tooltip|nil A table with header and text that will display as a tooltip when an enabled button is hovered over. Can also be a function that returns a tes3ui.showMessageMenu.params.tooltip.
--- @field tooltipDisabled tes3ui.showMessageMenu.params.tooltip|fun(callbackParams: table): tes3ui.showMessageMenu.params.tooltip|nil A table with header and text that will display as a tooltip when a disabled button is hovered over. Can also be a function that returns a tes3ui.showMessageMenu.params.tooltip.
