local plrs = game:GetService("Players")
local player = plrs.LocalPlayer
local pVars = player:WaitForChild("plrVars")
local ws = game:GetService("Workspace")
local camp = ws:WaitForChild("PlayArea").Camp :: Model
local stats = player:WaitForChild("PlayerGui"):WaitForChild("StatsGui")
local statsFrame = stats:WaitForChild("StatsFrame")
local welcomeGui = camp.Signs:WaitForChild("Welcome"):WaitForChild("Text"):WaitForChild("WelcomeGui") :: Part
local welcomeText = welcomeGui.TextLabel

welcomeGui.Enabled = true
welcomeText.Text = `Welcome {player.name}`

-- Stats UI

local pTotVisits = pVars.totVisits
local visitsLabel = statsFrame:WaitForChild("Visits")
pTotVisits.Changed:Connect(function()
	visitsLabel.Text = "Total Visits: " .. tostring(pTotVisits.Value)
end)

local pTotLogs = pVars.totLogs
local logsLabel = statsFrame:WaitForChild("Logs")
pTotLogs.Changed:Connect(function()
	logsLabel.Text = "Total Logs: " .. tostring(pTotLogs.Value)
end)

local pTotStones = pVars.totStones
local stonesLabel = statsFrame:WaitForChild("Stones")
pTotStones.Changed:Connect(function()
	stonesLabel.Text = "Total Stones: " .. tostring(pTotStones.Value)
end)

local pTotFlints = pVars.totFlints
local flintsLabel = statsFrame:WaitForChild("Flints")
pTotFlints.Changed:Connect(function()
	flintsLabel.Text = "Total Flints: " .. tostring(pTotFlints.Value)
end)

local pTotAxeSwings = pVars.totAxeSwings
local axeSwingsLabel = statsFrame:WaitForChild("Axe")
pTotAxeSwings.Changed:Connect(function()
	axeSwingsLabel.Text = "Total Axe Swings: " .. tostring(pTotAxeSwings.Value)
end)

local pTotPickSwings = pVars.totPickSwings
local pickSwingsLabel = statsFrame:WaitForChild("Pick")
pTotPickSwings.Changed:Connect(function()
	pickSwingsLabel.Text = "Total Pick Swings: " .. tostring(pTotPickSwings.Value)
end)
