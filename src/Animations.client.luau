local toolkits = game:GetService("ReplicatedStorage").Toolkits
local animate = require(toolkits:WaitForChild("Animate"))
local players = require(toolkits:WaitForChild("Players"))

local values = players.GetCurrentPlayer().plrVars
local axeSwingId = animate.GetAnimationId("AxeSwing")
local pickSwingId = animate.GetAnimationId("PickSwing")

animate.LoadAnimationOnChange(values.usingAxe, axeSwingId)
animate.LoadAnimationOnChange(values.usingPick, pickSwingId)
