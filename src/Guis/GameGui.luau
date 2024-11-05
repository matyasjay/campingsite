local Workspace = game:GetService("Workspace"):WaitForChild("PlayArea")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Persona = require(ReplicatedStorage.Toolkits:WaitForChild("Persona"))

--[=[
  @class GameGui
  @tag User Interface
]=]
local GameGui = {}

--[=[
  ![Restart Game Popup](https://p267.p3.n0.cdn.zight.com/items/yAueqNYA/eeeb548b-5898-4f1a-aac9-04ce89dfab01.jpg)

  @within GameGui
]=]
function GameGui.showGameFrame()
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

return GameGui
