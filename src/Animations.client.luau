local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Animate = require(Toolkits:WaitForChild("Animate"))
local Persona = require(Toolkits:WaitForChild("Persona"))
local Variables = Persona.GetPlayerVariable("Variables")

Animate.LoadAnimationOnChange(Variables.usingAxe, Animate.GetAnimationId("AxeSwing"))
Animate.LoadAnimationOnChange(Variables.usingPick, Animate.GetAnimationId("PickSwing"))
