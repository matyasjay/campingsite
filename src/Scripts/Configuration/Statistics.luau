--[=[
  @class StatisticsConfig
  @tag Player Variables
  @tag Configuration

  # Usage

  ```lua
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local StatisticsConfig = require(ReplicatedStorage:WaitForChild("Statistics"))
  local configKeys = StatisticsConfig.Keys -- normalized variable keys
  ```
]=]

--[=[
  @prop DefaultStatistics { string }
  @readonly
  @within StatisticsConfig
]=]
local DEFAULT_STATISTICS = {
	["TotalVisits"] = 0,
	["TotalLogs"] = 0,
	["TotalStones"] = 0,
	["TotalFlints"] = 0,
	["TotalAxeSwings"] = 0,
	["TotalPickSwings"] = 0,
}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Utils = require(ReplicatedStorage:WaitForChild("Utils"))

local StatisticsConfig = {}
StatisticsConfig.ValueType = "NumberValue"
StatisticsConfig.__index = StatisticsConfig

--[=[
  @prop Defaults {boolean}
  @within StatisticsConfig
]=]
StatisticsConfig.Defaults = Utils.GetDefaultsFromStore(DEFAULT_STATISTICS)

--[=[
  @prop Keys {string}
  @within StatisticsConfig
]=]
StatisticsConfig.Keys = Utils.GetKeysFromStore(DEFAULT_STATISTICS)

return StatisticsConfig
