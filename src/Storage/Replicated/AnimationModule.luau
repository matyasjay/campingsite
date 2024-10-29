local animMod = {}

local animTrack
local canTouch = false

function animMod.LoadAnimation(humanoid, animId)
  local newAnim = Instance.new("Animation")
  newAnim.AnimationId = animId
  animTrack = humanoid:LoadAnimation(newAnim)
  animTrack.Priority = Enum.AnimationPriority.Action
  animTrack.Looped = false
  animMod.PlayAnimation(humanoid)
  return true
end

function animMod.PlayAnimation(hum)
  if hum and canTouch == false then
    canTouch = true
    animTrack:Play()
    wait(1)
    canTouch = false
  end
end

return animMod
