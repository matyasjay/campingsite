local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Persona = require(ReplicatedStorage.Toolkits:WaitForChild("Persona"))
local StatsGui = require(ReplicatedStorage.UserInterface:WaitForChild("StatGui"))
local GameGui = require(ReplicatedStorage.UserInterface:WaitForChild("GameGui"))
local StatisticsVariable = require(ReplicatedStorage.Variables:WaitForChild("Statistics"))

GameGui.showWelcomeSign()

while true do
	local stats = StatisticsVariable.GetAll()
	for key, stat in stats do
		stat.Changed:Connect(function()
			StatsGui.showStatsFrame(Persona.GetCurrentPlayer())
		end)
	end
	task.wait(0.5)
end
