local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Animate = require(Toolkits:WaitForChild("Animate"))
local Persona = require(Toolkits:WaitForChild("Persona"))

local values = Persona.GetCurrentPlayer().plrVars

Animate.LoadAnimationOnChange(values.usingAxe, Animate.GetAnimationId("AxeSwing"))
Animate.LoadAnimationOnChange(values.usingPick, Animate.GetAnimationId("PickSwing"))
