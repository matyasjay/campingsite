local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = require(ReplicatedStorage.Toolkits:WaitForChild("Players"))

--[=[
  This class is responsible to handle animation loading and playing within
  the game. The methods providing abstract functionality to handle common
  tasks with ease. See individual documentation for details and capabilities.

  @class Animate
  @tag Toolkit
]=]
local Animate = {}

--[=[
  @prop animation Animation
  @within Animate
  @private
]=]
Animate.animation = nil

--[=[
  @prop debounce boolean
  @within Animate
  @private
]=]
Animate.debounce = false

--[=[
  Loads the animation referenced by its Asset ID to the provided humanoid.

  @param humanoid Humanoid -- The humanoid object to load the animation to
  @param animationId string -- The Asset ID of the animation to be loaded
  @return boolean -- True when the animation was properly loaded and executed
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
  Play the currently loaded animation.

  @param humanoid Humanoid
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

  @param animationName string -- The name of the requested animation
  @return string -- The Asset ID of the requested animation
]=]
function Animate.GetAnimationId(animationName: string)
	local loadedAnimation = ReplicatedStorage.Shared.Animations:WaitForChild(animationName)
	return loadedAnimation.AnimationId
end

--[=[
  Load the given animation referenced by its Asset ID when the provided boolean
  value has been changed.

  @param boolValue BoolValue -- The BoolValue to connect to
  @param animationId string -- The Asset ID of the animation to be loaded
]=]
function Animate.LoadAnimationOnChange(boolValue: BoolValue, animationId: string)
	local humanoid = Players.GetCurrentHumanoid()
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
