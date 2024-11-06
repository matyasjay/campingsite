--[=[
  @class StatsGui
  @tag User Interface
]=]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StatisticsConfig = require(ReplicatedStorage:WaitForChild("Statistics"))
local StatisticsVariable = require(ReplicatedStorage.Variables:WaitForChild("Statistics"))

local StatsGui = {}

--[=[
  ![StatisticsVariable HUD](https://p267.p3.n0.cdn.zight.com/items/L1uEwm28/76585f3b-599d-4151-942d-96cbc57d4944.jpg)

  @within StatsGui
  @param player Player
]=]
function StatsGui.showStatsFrame(player)
	local variables = StatisticsVariable.GetAll()
	local stats = {
		["Visits"] = variables[StatisticsConfig.Keys.TotalVisits].Value,
		["Logs"] = variables[StatisticsConfig.Keys.TotalLogs].Value,
		["Stones"] = variables[StatisticsConfig.Keys.TotalStones].Value,
		["Flints"] = variables[StatisticsConfig.Keys.TotalFlints].Value,
		["Pick Swings"] = variables[StatisticsConfig.Keys.TotalPickSwings].Value,
		["Axe Swings"] = variables[StatisticsConfig.Keys.TotalAxeSwings].Value,
	}
	local frame = player:WaitForChild("PlayerGui"):WaitForChild("StatsGui"):WaitForChild("StatsFrame")
	for label in stats do
		local text = frame:WaitForChild(label)
		text.Text = `Total {label}: {tostring(stats[label])}`
	end
end

return StatsGui
