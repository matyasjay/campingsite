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

return Animate
