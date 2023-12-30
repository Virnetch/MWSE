-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
-- More information: https://github.com/MWSE/MWSE/tree/master/docs

--- @meta
--- A game object which contains information on actor's animations.
--- 
--- Animations are divided into three layers. The layer 0 is the base layer containing all the base animations for every humanoid in the game, including the player (when in third person). These animations come from `base_anim.nif`. Layer 1 is for female animations. Any animations present in `base_anim_female.nif` override their male counterparts for humanoid races. For beast races, layer 1 animations come from `base_anim_kna.nif`. Layer 2 are the custom animations assigned to the actor.
--- @class tes3animationData
--- @field actorNode niBillboardNode|niCollisionSwitch|niNode|niSortAdjustNode|niSwitchNode Easy access to the actor's scene node.
--- @field animationGroups tes3animationGroup[] *Read-only*. An array of animation group objects applying to this actor, indexed by the [`tes3.animationGroup`](https://mwse.github.io/MWSE/references/animation-groups/) namespace. As this is a Lua array access, you will need to add one to the enum index.
--- @field animGroupLayerIndices number[] *Read-only*. The layer from which each of the actor's animation groups come. Indexed by the [`tes3.animationGroup`](https://mwse.github.io/MWSE/references/animation-groups/) namespace. As this is a Lua array access, you will need to add one to the enum index.
--- @field animGroupSoundGenCounts number[] *Read-only*. The number of sound generators for each of the animation groups, indexed by the [`tes3.animationGroup`](https://mwse.github.io/MWSE/references/animation-groups/) namespace. As this is a Lua array access, you will need to add one to the enum index.
--- @field approxRootTravelDistances number[] *Read-only*. The approximate root node travel distance over a cycle for each of the animation groups, indexed by the [`tes3.animationGroup`](https://mwse.github.io/MWSE/references/animation-groups/) namespace. As this is a Lua array access, you will need to add one to the enum index.
--- @field blinkMorphEndTime number Blink animation end time for `headMorphTiming`. Timing is specific to the current head model.
--- @field blinkMorphStartTime number Blink animation start time for `headMorphTiming`. Timing is specific to the current head model.
--- @field castSpeed number The animation speed multiplier for the spell casting animation. This is a feature added by MWSE.
--- 
--- It functions slightly differently to the other animation speed multipliers. It is not reset by the AI like the movement and weapon speeds. Therefore, it can be set before a spell is cast, as well as during casting. The speed will affect all further casting by the actor.
--- @field currentActionIndices number[] *Read-only*. The action index of the currently playing animation on each of the [body sections](https://mwse.github.io/MWSE/references/animation-body-sections/). As this is a Lua array access, you will need to add one to the enum index. The meaning of an action index depends on the specific animation group.
--- @field currentAnimGroupLayers number[] *Read-only*. The layer index of the currently playing animation on each of the [body sections](https://mwse.github.io/MWSE/references/animation-body-sections/). As this is a Lua array access, you will need to add one to the enum index.
--- @field currentAnimGroups number[] *Read-only*. The currently playing [animation group](https://mwse.github.io/MWSE/references/animation-groups/), on each of the [body sections](https://mwse.github.io/MWSE/references/animation-body-sections/). As this is a Lua array access, you will need to add one to the enum index.
--- @field currentSoundGenIndices number[] *Read-only*. The index of the currently used sound generator for each of the [body sections](https://mwse.github.io/MWSE/references/animation-body-sections/). As this is a Lua array access, you will need to add one to the enum index.
--- @field deltaTime number The time in seconds since the last update.
--- @field flags number 
--- @field hasOverrideAnimations boolean *Read-only*. True if the actor has some custom animations in the override layer. For example, drumming or sitting. These are assigned in the Construction Set or using [tes3.loadAnimation](https://mwse.github.io/MWSE/apis/tes3/#tes3loadanimation).
--- @field headGeometry niParticles|niRotatingParticles|niTriShape 
--- @field headMorphTiming number The timing offset of the head morph controller. Used to select either blinking or lipsync animations. Actively updated by the animation system during blinking or voiceovers. Timing is specific to the current head model.
--- @field headNode niBillboardNode|niCollisionSwitch|niNode|niSortAdjustNode|niSwitchNode 
--- @field keyframeLayers tes3animationDataSequenceGroup[] *Read-only*. 
--- @field lipsyncLevel number This value indicates whether the NPC is speaking or not. The table below describes the relationship.
--- 
--- Value      | Behavior
--- ---------- | ---------
---       -1.0 | The NPC isn't speaking.
---  0.0 - 1.0 | The NPC is speaking. The value roughly corresponds to the current loudness of the voiceover line. The `lipsyncLevel` is `0.0` when there is a silent part in the sound file the NPC is currently speaking. Also, the speaking actor's mouth is opened more when the value is higher.
--- 
--- @field loopCounts number[] *Read-only*. 
--- @field manager niKeyframeManager 
--- @field movementRootNode niBillboardNode|niCollisionSwitch|niNode|niSortAdjustNode|niSwitchNode Easy access to the actor's "MRT" movement root node.
--- @field movementSpeed number *Read-only*. The animation speed multiplier of movement animations. This includes walking, running, crouching, swimming, turning, jumping and other movement related animations.
--- @field nextLoopCounts number 
--- @field positionDeltaOfMovementRoot tes3vector3 Tracks the change from the last frame of the "MRT" child node that controls animation driven movement.
--- @field spine1Node niBillboardNode|niCollisionSwitch|niNode|niSortAdjustNode|niSwitchNode 
--- @field spine2Node niBillboardNode|niCollisionSwitch|niNode|niSortAdjustNode|niSwitchNode 
--- @field spineAngle number 
--- @field talkMorphEndTime number Lipsync animation end time for `headMorphTiming`. Timing is specific to the current head model.
--- @field talkMorphStartTime number Lipsync animation start time for `headMorphTiming`. Timing is specific to the current head model.
--- @field timeToNextBlink number The time in seconds until the next blink. It is fixed at 0 while the blink animation plays.
--- @field timings table<tes3.animationBodySection, number> The time in seconds indicating the current position within the animation for each individual body section, indexed by values in the [`tes3.animationBodySection`](https://mwse.github.io/MWSE/references/animation-body-sections/) table.
--- @field weaponSpeed number The animation speed multiplier of weapon animations. This includes all weapon related idle, attack, and ready/unready animations.
tes3animationData = {}

--- This method fetches the reference of the actor to whom this animation data belongs.
--- @return tes3reference result No description yet available.
function tes3animationData:getReference() end

--- This method plays an animation group on the related actor, invoking `playGroup` event.
--- @param animationGroup tes3.animationGroup The animation group to play. A value from [`tes3.animationGroup`](https://mwse.github.io/MWSE/references/animation-groups/) namespace.
--- @param startFlag tes3.animationStartFlag A flag for starting the group with, using [`tes3.animationStartFlag`](https://mwse.github.io/MWSE/references/animation-start-flags/) constants.
--- @param loopCount number If provided, the animation will repeat its loop section a given number of times. To make an animation play through once, set loopCount = 0, while -1 is used for infinite looping.
function tes3animationData:playAnimationGroup(animationGroup, startFlag, loopCount) end

--- This method plays an animation group on the provided body section of related actor, invoking `playGroup` event.
--- @param animationGroup tes3.animationGroup The animation group to play. A value from [`tes3.animationGroup`](https://mwse.github.io/MWSE/references/animation-groups/) namespace.
--- @param triIndex tes3.animationBodySection The body section on which to play the animation. A value from [`tes3.animationBodySection`](https://mwse.github.io/MWSE/references/animation-body-sections/) namespace.
--- @param startFlag tes3.animationStartFlag A flag for starting the group with, using [`tes3.animationStartFlag`](https://mwse.github.io/MWSE/references/animation-start-flags/) constants.
--- @param loopCount number If provided, the animation will repeat its loop section a given number of times. To make an animation play through once, set loopCount = 0, while -1 is used for infinite looping.
function tes3animationData:playAnimationGroupForIndex(animationGroup, triIndex, startFlag, loopCount) end

--- 
--- @param head niBillboardNode|niCollisionSwitch|niNode|niSortAdjustNode|niSwitchNode 
function tes3animationData:setHeadNode(head) end

--- 
--- @param kfData tes3keyframeDefinition 
--- @return boolean success No description yet available.
function tes3animationData:setOverrideLayerKeyframes(kfData) end

--- Swaps the animations and related animation driven data for the two animation groups given. Groups are indexed by [`tes3.animationGroup`](https://mwse.github.io/MWSE/references/animation-groups/). It can be used on animation groups of the same class with matching actions, e.g. runForward1h and runForward2c. It will also work on animations that are currently playing, except attack animations. Changing an attack animation during an attack will permanently break the character controller until you change it back. Currently playing movement animations may be reset slightly to resynchronize the movement cycle.
--- @param group1 number An animation group to swap from [`tes3.animationGroup`](https://mwse.github.io/MWSE/references/animation-groups/).
--- @param group2 number An animation group to swap from [`tes3.animationGroup`](https://mwse.github.io/MWSE/references/animation-groups/).
function tes3animationData:swapAnimationGroups(group1, group2) end

