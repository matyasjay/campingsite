local plrs = game:GetService("Players")
local player = plrs.LocalPlayer
local ws = game:GetService("Workspace")
local camp = ws:WaitForChild("PlayArea").Camp :: Model
local welcomeGui = camp.Signs:WaitForChild("Welcome"):WaitForChild("Text"):WaitForChild("WelcomeGui") :: Part
local welcomeText = welcomeGui.TextLabel

welcomeGui.Enabled = true
welcomeText.Text = `Welcome {player.name}`
