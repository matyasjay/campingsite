local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Animate = require(Toolkits:WaitForChild("Animate"))
local Persona = require(Toolkits:WaitForChild("Persona"))
local Values = Persona.GetPlayerVariable("plrVars")

Animate.LoadAnimationOnChange(Values.usingAxe, Animate.GetAnimationId("AxeSwing"))
Animate.LoadAnimationOnChange(Values.usingPick, Animate.GetAnimationId("PickSwing"))
