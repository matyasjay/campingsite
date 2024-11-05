local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animate = require(ReplicatedStorage.Toolkits:WaitForChild("Animate"))
local Attributes = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))

--[=[
  @class Animations
]=]
Animate.LoadAnimationOnChange(Attributes.Get("usingAxe"), Animate.GetAnimationId("AxeSwing"))
Animate.LoadAnimationOnChange(Attributes.Get("usingPick"), Animate.GetAnimationId("PickSwing"))
