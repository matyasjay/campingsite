local Camp = game:GetService("Workspace"):WaitForChild("PlayArea").Camp
local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Variables = game:GetService("ReplicatedStorage").Variables
local PlayerStatistics = require(Variables:WaitForChild("PlayerStatistics"))
local Persona = require(Toolkits:WaitForChild("Persona"))
local Player = Persona.GetCurrentPlayer()
local Statistics = Persona.GetPlayerVariable("Statistics")

local statsGui = Player:WaitForChild("PlayerGui"):WaitForChild("StatsGui"):WaitForChild("StatsFrame")
local welcomeSign = Camp.Signs:WaitForChild("Welcome"):WaitForChild("Text"):WaitForChild("WelcomeGui")

welcomeSign.Enabled = true
welcomeSign.TextLabel.Text = `Welcome {Player.name}`

--[=[
  Configuration class for the current [Player]'s displayed statistics.

  @class StatsGui
  @tag User Interface
]=]
--[=[
  List of statistical entries that are displayed on the [ScreenGui] for the current [Player].  

  @prop Stats {[string]: number}
  @within StatsGui
]=]
local Stats = {
	["Visits"] = Statistics.totalVisits,
	["Logs"] = Statistics.totalLogs,
	["Stones"] = Statistics.totalStones,
	["Flints"] = Statistics.totalFlints,
	["Axe Swings"] = Statistics.totalAxeSwings,
	["Pick Swings"] = Statistics.totalPickSwings,
}

for index, stat in Stats do
	stat.Changed:Connect(function()
		statsGui:WaitForChild(index).Text = `Total {index}: {tostring(stat.Value)}`
	end)
end
