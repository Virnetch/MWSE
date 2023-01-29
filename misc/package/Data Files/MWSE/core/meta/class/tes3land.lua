-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
-- More information: https://github.com/MWSE/MWSE/tree/master/docs

--- @meta
--- A heightfield landscape used by an exterior cell.
--- @class tes3land : tes3baseObject
--- @field flags number *Read-only*. A numeric representation of the packed bit flags for the landscape, typically accessed from other properties.
--- @field gridX number *Read-only*. The cell's X grid coordinate.
--- @field gridY number *Read-only*. The cell's Y grid coordinate.
--- @field maxHeight number *Read-only*. The height of the highest land vertex.
--- @field minHeight number *Read-only*. The height of the lowest land vertex.
--- @field sceneNode niBillboardNode|niCollisionSwitch|niNode|niSwitchNode *Read-only*. The scene graph node for the landscape. Contains sub nodes for land patches.
--- @field textureIndices number[] *Read-only*. An array containing texture index numbers. They are 0-based indexes. They index into the global land texture list, `tes3.dataHandler.nonDynamicData.landTextures`. Adjustment is required when indexing the list through lua.
