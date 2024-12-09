--[=[
  @class Remote
  @tag Main Script
]=]

local Remote = {}

--[=[
  @prop Enabled true
  @tag Configuration
  @readonly
  @within Remote
]=]
Remote.Enabled = true

--[=[
  @prop Version 0.2.4
  @tag Configuration
  @readonly
  @within Remote

  :::danger
  __It is highly advised to bump the _Remote Version_ after changing configuration data.__

  __Changing remote data structure may lead to data loss. 
  Ensure the changes are not breaking and could be deployed safely or backup your 
  existing data before the push!__
  :::
]=]
Remote.Version = "0.2.5"

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataStore = game:GetService("DataStoreService")
local Store = DataStore:GetDataStore(`CampingStats_{Remote.Version}`)
local Attributes = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))
local AttributesConfig = require(ReplicatedStorage:WaitForChild("Attributes"))
local Statistics = require(ReplicatedStorage.Variables:WaitForChild("Statistics"))
local StatisticsConfig = require(ReplicatedStorage:WaitForChild("Statistics"))
local StatsGui = require(ReplicatedStorage.UserInterface:WaitForChild("StatGui"))

Remote.Attributes = AttributesConfig.Keys
Remote.Statistics = StatisticsConfig.Keys

--[=[
  Executed on the [`Players.PlayerAdded`](https://create.roblox.com/docs/studio/players#players-added)
  event to synchronise the [Player Attributes](https://create.roblox.com/docs/studio/properties#instance-attributes) 
  with the default and remote variables. Updates the [DataStore] when 
  [`game.OnClose`](https://create.roblox.com/docs/reference/engine/classes/ServiceProvider#Close) event occurs.

  ### Usage
  <br><br/>
  ### `src/Scripts/Main.server.luau`

  ```lua
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local Players = game:GetService("Players")
  local Remote = require(ReplicatedStorage:WaitForChild("Remote"))

  Players.PlayerAdded:Connect(Remote.Initialize)
  ```

  :::info Prepare and check remote connection
  1. Enable HTTP connection in Roblox Studio 

  2. Configure the default values in
     - [Attributes Config](/api/AttributesConfig)
     - [Statistics Config](/api/StatisticsConfig)
  3. Test the remote availability by playing your game
  :::

  @param player Player
  @within Remote
]=]
function Remote.Initialize(player)
	player.CharacterAppearanceLoaded:Connect(function()
		Remote.SetDefaults(player, Attributes, AttributesConfig.Defaults, "BoolValue")
		Remote.SetDefaults(player, Statistics, StatisticsConfig.Defaults, "NumberValue")
		local data = Remote.GetRemote(player)
		local totalVisits = data[StatisticsConfig.Keys.TotalVisits] or 0
		local currentVisits = typeof(totalVisits) == "number" and totalVisits or totalVisits.Value
		Statistics.Put(StatisticsConfig.Keys.TotalVisits, currentVisits + 1)
		StatsGui.showStatsFrame(player)
		if Remote.Enabled then
			Remote.PushRemote(player, data)
			game.OnClose = Remote.Teardown(player, data)
		end
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
	local data = Statistics.GetAll()
	if Remote.Enabled then
		data = Store:GetAsync(player.UserId) or data
		for key, value in data do
			Statistics.Put(key, typeof(data[key]) == "Instance" and data[key].Value or data[key])
		end
	end
	return data
end

function Remote.PushRemote(player, data)
	if Remote.Enabled then
		local stored = {}
		pcall(function()
			for key in data do
				stored[key] = typeof(data[key]) == "Instance" and data[key].Value or data[key]
			end
			Store:SetAsync(player.UserId, stored)
		end)
	end
end

function Remote.Teardown(player, data)
	return function()
		local statistics = Statistics.GetAll()
		Remote.PushRemote(player, statistics)
	end
end

return Remote
