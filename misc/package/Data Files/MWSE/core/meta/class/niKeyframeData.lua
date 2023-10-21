-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
-- More information: https://github.com/MWSE/MWSE/tree/master/docs

--- @meta
--- A collection of position, rotation, and scale keys used on NiKeyframeControllers.
--- @class niKeyframeData : niObject
--- @field positionKeyCount number *Read-only*. The number of position keys available.
--- @field positionKeys niBezPosKey[]|niPosKey[]|niTCBPosKey[] *Read-only*. The available position keys.
--- @field positionType ni.animationKeyType *Read-only*. The type of animation key used for position keys. Maps to values in [`ni.animationKeyType`](https://mwse.github.io/MWSE/references/ni/animation-key-types/) table.
--- @field rotationKeyCount number *Read-only*. The number of rotation keys available.
--- @field rotationKeys niBezRotKey[]|niEulerRotKey[]|niRotKey[]|niTCBRotKey[] *Read-only*. The available rotation keys.
--- @field rotationType ni.animationKeyType *Read-only*. The type of animation key used for rotation keys. Maps to values in [`ni.animationKeyType`](https://mwse.github.io/MWSE/references/ni/animation-key-types/) table.
--- @field scaleKeyCount number *Read-only*. The number of scale keys available.
--- @field scaleKeys niBezFloatKey[]|niFloatKey[]|niTCBFloatKey[] *Read-only*. The available scale keys.
--- @field scaleType ni.animationKeyType *Read-only*. The type of animation key used for scale keys. Maps to values in [`ni.animationKeyType`](https://mwse.github.io/MWSE/references/ni/animation-key-types/) table.
niKeyframeData = {}

--- This updates the keyframe data's position, rotation, and scale keys as is appropriate for their key types.
function niKeyframeData:updateDerivedValues() end

