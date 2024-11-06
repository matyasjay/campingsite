--[=[
  @class Remote
  @tag Main Script
  @tag Configuration
]=]

local Remote = {}

--[=[
  @prop Version 0.2.2
  @readonly
  @within Remote

  :::danger
  __It is highly advised to bump the _Remote Version_ after changing configuration data.__

  __Changing remote data structure may lead to data loss. 
  Ensure the changes are not breaking and could be deployed safely or backup your 
  existing data before the push!__
  :::
]=]

Remote.Version = "0.2.2"

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataStore = game:GetService("DataStoreService")
local Store = DataStore:GetDataStore("CampingStats_0.2.2")
local AttributesConfig = require(ReplicatedStorage:WaitForChild("AttributesConfig"))
local StatisticsConfig = require(ReplicatedStorage:WaitForChild("StatisticsConfig"))
local Attributes = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))
local Statistics = require(ReplicatedStorage.Variables:WaitForChild("Statistics"))
local StatsGui = require(ReplicatedStorage.Guis:WaitForChild("StatGui"))

Remote.Attributes = AttributesConfig.Keys
Remote.Statistics = StatisticsConfig.Keys

--[=[
  Executed on the [`Players.PlayerAdded`](https://create.roblox.com/docs/studio/players#players-added)
  event to synchronise the [Player Attributes](https://create.roblox.com/docs/studio/properties#instance-attributes) 
  with the default and remote variables. Updates the [DataStore] when 
  [`game.OnClose`](https://create.roblox.com/docs/reference/engine/classes/ServiceProvider#Close) event occurs.

  ### Usage
  ```lua
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local Players = game:GetService("Players")
  local Remote = require(ReplicatedStorage:WaitForChild("Remote"))

  Players.PlayerAdded:Connect(Remote.Initialize)
  ```

  ### Checklist
  1. Enable HTTP connection in Roblox Studio 

  2. Configure the default values in
     - [Attributes Config](/api/AttributesConfig)
     - [Statistics Config](/api/StatisticsConfig)
  3. Test the remote availability by playing your game

  @param player Player
  @within Remote
]=]
function Remote.Initialize(player)
	player.CharacterAppearanceLoaded:Connect(function()
		local data = Remote.GetRemote(player)
		Statistics.Put(StatisticsConfig.Keys.TotalVisits, data[StatisticsConfig.Keys.TotalVisits].Value + 1)
		StatsGui.showStatsFrame(player)
		Remote.PushRemote(player, data)
		game.OnClose = Remote.Teardown(player, data)
	end)
end

function Remote.SetDefaults(player, Config, config, valueType)
	local entry = Instance.new("Folder", player)
	entry.Name = Config.Name
	for _, value in config do
		local variable = Instance.new(valueType, entry)
		variable.Name = value.Name
		variable.Value = value.Value
	end
	Config.Set(entry:GetChildren())
end

function Remote.GetRemote(player)
	Remote.SetDefaults(player, Attributes, AttributesConfig.Defaults, "BoolValue")
	Remote.SetDefaults(player, Statistics, StatisticsConfig.Defaults, "NumberValue")
	local data = Store:GetAsync(player.UserId)
	if data then
		for key, value in data do
			Statistics.Put(key, data[key])
		end
	end
	return data or Statistics.GetAll()
end

function Remote.PushRemote(player, data)
	pcall(function()
		Store:SetAsync(player.UserId, data)
	end)
end

function Remote.Teardown(player, data)
	return function()
		local stored = {}
		local statistics = Statistics.GetAll()
		for key in data do
			stored[key] = statistics[key].Value
		end
		pcall(function()
			Store:SetAsync(player.UserId, stored)
		end)
	end
end

return Remote
