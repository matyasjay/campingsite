local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Camp = game:GetService("Workspace"):WaitForChild("PlayArea").Camp :: Model
local Players = require(Toolkits:WaitForChild("Persona"))
local Player = Players.GetCurrentPlayer() :: Player
local Variables = Player:WaitForChild("plrVars") :: { [string]: NumberValue }

local statsGui = Player:WaitForChild("PlayerGui"):WaitForChild("StatsGui"):WaitForChild("StatsFrame") :: Frame
local welcomeSign = Camp.Signs:WaitForChild("Welcome"):WaitForChild("Text"):WaitForChild("WelcomeGui") :: SurfaceGui

welcomeSign.Enabled = true
welcomeSign.TextLabel.Text = `Welcome {Player.name}`

--[=[
  Configuration class for the current [Player]'s displayed statistics.

  @class StatsGui
  @tag User Interface
]=]
--[=[
  Represents an entry that is displayed as part of the active [ScreenGui]
  showing the details of the current [Player]'s actual statistics.

  @interface Stat
  @within StatsGui
  .Label string -- The user facing  name of the stat displayed as is in the [ScreenGui]
  .Stat number -- The variable holding the respective value for the given stat
]=]
--[=[
  List of unique [Stat] entries that are displayed on the [ScreenGui] for the current [Player] .  

  @prop Stats {Stat}
  @within StatsGui
]=]
local Stats = {
	{ "Visits", Variables.totVisits },
	{ "Logs", Variables.totLogs },
	{ "Stones", Variables.totStones },
	{ "Flints", Variables.totFlints },
	{ "Axe Swings", Variables.totAxeSwings },
	{ "Pick Swings", Variables.totPickSwings },
}

local function display(_, stat)
	local currentLabel = statsGui:WaitForChild(stat[1])
	local currentValue = stat[2]
	currentValue.Changed:Connect(function()
		currentLabel.Text = `Total {stat[1]}: {tostring(currentValue.Value)}`
	end)
end

table.foreach(Stats, display)
