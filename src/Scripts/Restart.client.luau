local TRANSITION_SEC = 5

local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Persona = require(ReplicatedStorage.Toolkits:WaitForChild("Persona"))
local Attributes = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))
local AttributesConfig = require(ReplicatedStorage:WaitForChild("Attributes"))

local player = Persona.GetCurrentPlayer()
local frame = player:WaitForChild("PlayerGui"):WaitForChild("GameGui"):WaitForChild("GameFrame")
local button = frame.TextButton :: TextButton

local function resetGame()
	local camp = Workspace.Camp
	local logs = camp:WaitForChild("FirePit"):WaitForChild("Woods"):GetChildren()
	local base = camp:WaitForChild("FirePit"):WaitForChild("PitBase")
	local fire = camp:WaitForChild("FirePit"):WaitForChild("Fire").Fire
	local sign = camp.Signs:WaitForChild("Feedback"):WaitForChild("Back"):WaitForChild("SignGui")
	base:SetAttribute("logCount", 0)
	base:SetAttribute("stone", false)
	base:SetAttribute("flint", false)
	for i = 1, #logs do
		logs[i].Transparency = 1
	end
	fire.Enabled = false
	sign.Enabled = false
	Attributes.Put(AttributesConfig.Keys.HasLog, false)
	Attributes.Put(AttributesConfig.Keys.HasStone, false)
	Attributes.Put(AttributesConfig.Keys.HasFlint, false)
	local progress = 0
	while task.wait(1) and progress ~= TRANSITION_SEC do
		progress += 1
		Lighting.TimeOfDay = `{21 - progress}:00:00`
	end
end

button.Activated:Connect(function()
	frame.Visible = false
	resetGame()
end)
