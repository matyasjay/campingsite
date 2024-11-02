local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Animate = require(Toolkits:WaitForChild("Animate"))
local Persona = require(Toolkits:WaitForChild("Persona"))

local values = Persona.GetCurrentPlayer().plrVars
local axeSwingId = Animate.GetAnimationId("AxeSwing")
local pickSwingId = Animate.GetAnimationId("PickSwing")

Animate.LoadAnimationOnChange(values.usingAxe, axeSwingId)
Animate.LoadAnimationOnChange(values.usingPick, pickSwingId)
