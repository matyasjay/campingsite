local replicatedStorage = game:GetService("ReplicatedStorage")
local players = require(replicatedStorage.Toolkits:WaitForChild("Players"))

--[=[
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

  @param humanoid Humanoid
  @param animationId string
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
	local loadedAnimation = replicatedStorage.Shared.Animations:WaitForChild(animationName)
	return loadedAnimation.AnimationId
end

--[=[
  Load the given animation referenced by its Asset ID when the provided boolean
  value has been changed.

  @param boolValue BoolValue -- The BoolValue to connect to
  @param animationId string -- The Asset ID of the animation to be loaded
]=]
function Animate.LoadAnimationOnChange(boolValue: BoolValue, animationId: string)
	local humanoid = players.GetCurrentHumanoid()
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
