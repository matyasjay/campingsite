local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Variables = game:GetService("ReplicatedStorage").Variables
local PlayerVariables = require(Variables:WaitForChild("PlayerVariables") :: ModuleScript)
local Persona = require(Toolkits:WaitForChild("Persona"))
local Workspace = game:GetService("Workspace")

local camp = Workspace:WaitForChild("PlayArea").Camp
local player = Persona.GetCurrentPlayer()
local frame = player:WaitForChild("PlayerGui"):WaitForChild("GameGui"):WaitForChild("GameFrame")
local button = frame.TextButton :: TextButton

local function resetGame()
	local woodModel = camp:WaitForChild("FirePit"):WaitForChild("Wood"):GetChildren()
	local pitBase = camp:WaitForChild("FirePit"):WaitForChild("PitBase")
	local fire = camp:WaitForChild("FirePit"):WaitForChild("Fire").Fire
	local sign = camp.Signs:WaitForChild("Feedback"):WaitForChild("Back"):WaitForChild("SignGui")

	fire.Enabled = false
	pitBase:SetAttribute("logCount", 0)
	pitBase:SetAttribute("stone", false)
	pitBase:SetAttribute("flint", false)
	sign.Enabled = false

	for i = 1, #woodModel do
		woodModel[i].Transparency = 1
	end

	PlayerVariables.SetVariable("hasLog", false)
	PlayerVariables.SetVariable("hasStone", false)
	PlayerVariables.SetVariable("hasFlint", false)
end

button.MouseButton1Click:Connect(function()
	frame.Visible = false
	resetGame()
end)
