local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local StatsGui = require(ReplicatedStorage.Guis:WaitForChild("StatGui"))
local Persona = require(ReplicatedStorage.Toolkits:WaitForChild("Persona"))

local player = Persona.GetCurrentPlayer()
local camp = Workspace:WaitForChild("PlayArea").Camp
local welcomeSign = camp.Signs:WaitForChild("Welcome"):WaitForChild("Text"):WaitForChild("WelcomeGui")

welcomeSign.Enabled = true
welcomeSign.TextLabel.Text = `Welcome {player.name}`

--StatsGui.showStatsFrame(player)
