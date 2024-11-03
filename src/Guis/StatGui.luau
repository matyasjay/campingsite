local Variables = game:GetService("ReplicatedStorage").Variables
local PlayerStatistics = require(Variables:WaitForChild("PlayerStatistics"))

--[=[
  This class represents the GUI configuration for the current [Player]'s displayed statistics.

  @class StatsGui
  @tag User Interface
]=]
local StatsGui = {}

--[=[
  Show the general statistics for the current [Player] in an on-screen GUI element.

  @function showStatsFrame 
  @within StatsGui
]=]
function StatsGui.showStatsFrame(player: Player)
	local variables = PlayerStatistics.GetVariables()

	local stats = {
		["Visits"] = variables.totalVisits.Value,
		["Logs"] = variables.totalLogs.Value,
		["Stones"] = variables.totalStones.Value,
		["Flints"] = variables.totalFlints.Value,
		["Pick Swings"] = variables.totalPickSwings.Value,
		["Axe Swings"] = variables.totalAxeSwings.Value,
	}

	local frame = player:WaitForChild("PlayerGui"):WaitForChild("StatsGui"):WaitForChild("StatsFrame")

	for key in stats do
		local label = frame:WaitForChild(key)
		label.Text = `Total {key}: {tostring(stats[key])}`
	end
end

return StatsGui
