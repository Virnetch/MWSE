-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
-- More information: https://github.com/MWSE/MWSE/tree/master/docs

--- @meta
--- Object that represent a camera. Position and orientation is determined by parent properties. This enables the cameras to be attached to scene graph objects and follow them automatically, as they move.
--- @class niCamera : niAVObject, niObjectNET, niObject
--- @field cullingPlanes tes3vector4[] The culling planes of the camera: near, far, left, right, top, and bottom.
--- @field lodAdjust number The level-of-detail adjustment value for the camera. This value is used by NiLODNode objects to multiply the distance between the object whose LOD is being computed and the camera. A higher value will lower the LOD of the objects drawn by the camera.
--- @field port tes3vector4 The port on the backbuffer of the camera. Represents the rectangular portion of the rendering backbuffer to which the camera's view rectangle is drawn (purely 2D mapping). These values are called port settings. The ordering: X - left, Y - right, Z - top and W - bottom. All port settings must be in the unit interval [0, 1]. The left edge of the backbuffer is 0.0, the right edge is 1.0. The top edge of the backbuffer is 1.0, the bottom edge is 0.0.
--- @field renderer niRenderer *Read-only*. The renderer of the camera.
--- @field scene niBillboardNode|niCollisionSwitch|niNode|niSortAdjustNode|niSwitchNode *Read-only*. The scene of the camera.
--- @field viewDistance number The view distance of the camera.
--- @field worldDirection tes3vector3 Defines the X-axis of the camera.
--- @field worldRight tes3vector3 Defines the Z-axis of the camera.
--- @field worldToCamera tes3matrix44 The world-to-camera transform matrix in row-major order.
--- @field worldUp tes3vector3 Defines the Y-axis of the camera.
niCamera = {}

--- This method clears the current render target of the camera's renderer. Uses flag values from [`ni.cameraClearFlags`](https://mwse.github.io/MWSE/references/ni/camera-clear-flags/).
--- @param flags ni.cameraClearFlags? *Default*: `ni.cameraClearFlags.all`. No description yet available.
function niCamera:clear(flags) end

--- This method renders the currently-attached scene graph to the active renderer.
--- @param something boolean? *Default*: `false`. No description yet available.
function niCamera:click(something) end

--- Update the camera's local rotation so that it is looking at the given point, with an up vector as close as possible to the given up vector. Both parameters are assumed to be in world space.
--- @param point tes3vector3 No description yet available.
--- @param up tes3vector3 No description yet available.
--- @return boolean success It's false when the provided location is equal to the location of the camera. It's true on success.
function niCamera:lookAtWorldPoint(point, up) end

--- Causes the current backbuffer of the attached display to be drawn to the frontbuffer, by swapping the two.
function niCamera:swapBuffers() end

--- Given a screen space position, calculates the world position and outlook direction. This can be useful when trying to find a reference under a UI element, such as the cusor.
---
--- [Examples available in online documentation](https://mwse.github.io/MWSE/types/niCamera/#windowpointtoray).
--- @param point tes3vector2|number[] The screen position to calculate a world ray for. Screen space is measured as ([-screenWidth/2, screenWidth/2], [-screenHeight/2, screenHeight/2]) with up-right being positive and an origin at the center of the screen.
--- @return tes3vector3 origin The world point that the given screen position looks out from.
--- @return tes3vector3 direction The look direction of the camera from the given origin point.
function niCamera:windowPointToRay(point) end

--- Given a world coordinate position, calculates where that point relates to the screen space.
--- @param point tes3vector3 The world position to calculate screen position for.
--- @return tes3vector2 screenPosition The screen space position. Screen space is measured as ([-screenWidth/2, screenWidth/2], [-screenHeight/2, screenHeight/2]) with up-right being positive and an origin at the center of the screen.
function niCamera:worldPointToScreenPoint(point) end

