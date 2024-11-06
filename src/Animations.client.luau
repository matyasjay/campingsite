--[=[
  @class Animations
  @tag Main Script
]=]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animate = require(ReplicatedStorage.Toolkits:WaitForChild("Animate"))
local Attributes = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))
local Configuration = require(ReplicatedStorage:WaitForChild("AttributesConfig"))

Animate.LoadAnimationOnChange(Attributes.Get(Configuration.Keys.UsingAxe), Animate.GetAnimationId("AxeSwing"))
Animate.LoadAnimationOnChange(Attributes.Get(Configuration.Keys.UsingPick), Animate.GetAnimationId("PickSwing"))
