--- @meta
--- @diagnostic disable:undefined-doc-name

--- A structure containing properties specific to hyperlinks.
--- @class tes3uiHyperlink : tes3uiWidget
--- @field confirm boolean If true, a confirmation prompt will be shown before any URLs are opened.
--- @field url string The URL to open if the element is clicked.
tes3uiHyperlink = {}

--- Opens a contained URL. If the `confirm` property is set, a modal prompt will be given to confirm the user wants to open the URL.
function tes3uiHyperlink:openURL() end

