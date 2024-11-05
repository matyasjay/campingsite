local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Persona = require(ReplicatedStorage.Toolkits:WaitForChild("Persona"))

--[=[
  This class is responsible to handle [Animation] loading and playing within
  the game. The methods providing abstract functionality to handle common
  tasks with ease. See individual documentation for details and capabilities.

  @class Animate
  @tag Toolkit
]=]
local Animate = {}

--[=[
  The current [Animation] object that is loaded into the [Humanoid]

  @prop animation Animation
  @within Animate
  @private
]=]
Animate.animation = nil

--[=[
  Debounce helper for the current [Animation]

  @prop debounce boolean
  @within Animate
  @private
]=]
Animate.debounce = false

--[=[
  Loads the [Animation] referenced by its Asset ID to the provided [Humanoid].

  @param humanoid Humanoid -- The [Humanoid] object to load the animation to
  @param animationId string -- The Asset ID of the [Animation] to be loaded
  @return boolean -- True when the [Animation] was properly loaded and played
]=]
function Animate.LoadAnimation(humanoid, animationId)
	local newAnimation = Instance.new("Animation")
	newAnimation.AnimationId = animationId
	Animate.animation = humanoid:LoadAnimation(newAnimation)
	Animate.animation.Priority = Enum.AnimationPriority.Action
	Animate.animation.Looped = false
	Animate.PlayAnimation(humanoid)
	return true
end

--[=[
  Play the currently loaded [Animation].

  @param humanoid Humanoid -- The [Humanoid] to play the animation on
  @private
]=]
function Animate.PlayAnimation(humanoid)
	if humanoid and Animate.debounce == false then
		Animate.debounce = true
		Animate.animation:Play()
		task.wait(1)
		Animate.debounce = false
	end
end

--[=[
  Get the Asset ID of the given animation stored in the Shared storage.

  @param animationName string -- The local name of the requested [Animation]
  @return string -- The Asset ID of the requested [Animation] 
]=]
function Animate.GetAnimationId(animationName)
	local loadedAnimation = ReplicatedStorage.Shared.Animations:WaitForChild(animationName) or {}
	return tostring(loadedAnimation.AnimationId or "")
end

--[=[
  Load the given [Animation] referenced by its Asset ID when the provided
  [BoolValue] has been changed.

  @param boolValue BoolValue -- The [BoolValue] to connect to
  @param animationId string -- The Asset ID of the [Animation] to be loaded
]=]
function Animate.LoadAnimationOnChange(boolValue: BoolValue, animationId: string)
	local humanoid = Persona.GetCurrentHumanoid()
	boolValue.Changed:Connect(function()
		if boolValue.Value == true then
			Animate.debounce = false
			local success = Animate.LoadAnimation(humanoid, animationId)
			if success then
				Animate.debounce = true
			end
		end
	end)
end

return Animate
