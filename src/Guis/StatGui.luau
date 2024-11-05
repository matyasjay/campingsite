local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Statistics = require(ReplicatedStorage.Variables:WaitForChild("Statistics"))

--[=[
  @class StatsGui
  @tag User Interface
]=]
local StatsGui = {}

--[=[
  ![Statistics HUD](https://p267.p3.n0.cdn.zight.com/items/yAueqmkW/5f822255-5eb0-4565-b86d-45bf029f3e61.jpg)

  @within StatsGui
  @param player Player
]=]
function StatsGui.showStatsFrame(player)
	local variables = Statistics.GetAll()
	local stats = {
		["Visits"] = variables.totalVisits.Value,
		["Logs"] = variables.totalLogs.Value,
		["Stones"] = variables.totalStones.Value,
		["Flints"] = variables.totalFlints.Value,
		["Pick Swings"] = variables.totalPickSwings.Value,
		["Axe Swings"] = variables.totalAxeSwings.Value,
	} :: { [string]: number }
	local frame = player:WaitForChild("PlayerGui"):WaitForChild("StatsGui"):WaitForChild("StatsFrame")
	for key in stats do
		local label = frame:WaitForChild(key)
		label.Text = `Total {key}: {tostring(stats[key])}`
	end
end

return StatsGui
