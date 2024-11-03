local Variables = game:GetService("ReplicatedStorage").Variables
local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Animate = require(Toolkits:WaitForChild("Animate"))
local PlayerVariables = require(Variables:WaitForChild("PlayerVariables"))

Animate.LoadAnimationOnChange(PlayerVariables.GetVariable("usingAxe"), Animate.GetAnimationId("AxeSwing"))
Animate.LoadAnimationOnChange(PlayerVariables.GetVariable("usingPick"), Animate.GetAnimationId("PickSwing"))
