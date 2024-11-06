--[=[
  @class StatisticsConfig
  @tag Player Variables
  @tag Configuration

  # Usage

  ```lua
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local StatisticsConfig = require(ReplicatedStorage:WaitForChild("StatisticsConfig"))
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

local PlayerStatistics = {}
PlayerStatistics.ValueType = "NumberValue"
PlayerStatistics.__index = PlayerStatistics

--[=[
  @prop Defaults {boolean}
  @within StatisticsConfig
]=]
PlayerStatistics.Defaults = Utils.GetDefaultsFromStore(DEFAULT_STATISTICS)

--[=[
  @prop Keys {string}
  @within StatisticsConfig
]=]
PlayerStatistics.Keys = Utils.GetKeysFromStore(DEFAULT_STATISTICS)

return PlayerStatistics
