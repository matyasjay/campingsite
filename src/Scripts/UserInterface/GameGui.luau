local TRANSITION_SEC = 5

local Lighting = game:GetService("Lighting")

--[=[
@class GameGui
@tag User Interface
]=]

local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Persona = require(ReplicatedStorage.Toolkits:WaitForChild("Persona"))

local GameGui = {}

--[=[
  ![Restart Game Popup](https://p267.p3.n0.cdn.zight.com/items/yAueqNYA/eeeb548b-5898-4f1a-aac9-04ce89dfab01.jpg)

  @within GameGui
]=]
function GameGui.showGameFrame()
	local progress = 0
	while task.wait(1) and progress ~= TRANSITION_SEC do
		progress += 1
		Lighting.TimeOfDay = `{16 + progress}:00:00`
	end
	for _, player in pairs(Persona.GetPlayers()) do
		player.PlayerGui.GameGui.GameFrame.Visible = true
	end
end

--[=[
  ![Welcome Sign](https://p267.p3.n0.cdn.zight.com/items/4guGE1E5/73ab6575-3168-44b8-aa5a-7c7faf5d04c0.jpg)

  @within GameGui
]=]
function GameGui.showWelcomeSign()
	local player = Persona.GetCurrentPlayer()
	local welcomeSign = Workspace.Camp.Signs:WaitForChild("Welcome"):WaitForChild("Text"):WaitForChild("WelcomeGui")
	welcomeSign.Enabled = true
	welcomeSign.TextLabel.Text = `Welcome {player.name}`
end

--[=[
  ![Welcomet Needs](https://p267.p3.n0.cdn.zight.com/items/wbuqgGq2/e5b210eb-ea8e-4944-8cee-ee2500a9e24a.jpg)

  @within GameGui
]=]
function GameGui.showPitNeeds(message: string)
	local sign = Workspace.Camp.Signs:WaitForChild("Feedback").Back:WaitForChild("SignGui")
	sign.TextLabel.Text = message
	sign.Enabled = true
end

return GameGui
