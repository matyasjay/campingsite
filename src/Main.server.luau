--[=[
  @class Configuration
]=]
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local DataStore = game:GetService("DataStoreService")
local Store = DataStore:GetDataStore("CampingStats_0.2.1")
local Persona = require(ReplicatedStorage.Toolkits:WaitForChild("Persona"))
local Attributes = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))
local Statistics = require(ReplicatedStorage.Variables:WaitForChild("Statistics"))
local StatsGui = require(ReplicatedStorage.Guis:WaitForChild("StatGui"))

local DEFAULT_VARIABLES = {
	["Attributes"] = {
		["hasLog"] = false,
		["hasStone"] = false,
		["hasFlint"] = false,
		["hasAxe"] = false,
		["hasPick"] = false,
		["usingAxe"] = false,
		["usingPick"] = false,
	},
	["Statistics"] = {
		["totalVisits"] = 0,
		["totalLogs"] = 0,
		["totalStones"] = 0,
		["totalFlints"] = 0,
		["totalPickSwings"] = 0,
		["totalAxeSwings"] = 0,
	},
}

local function addVariable(className, folder, name, value)
	local variable = Instance.new(className, folder)
	variable.Name = name
	variable.Value = value
end

local function initialize(player)
	player.CharacterAppearanceLoaded:Connect(function(character)
		local player = Persona.GetPlayerFromCharacter(character)
		for entryKey, variables in DEFAULT_VARIABLES do
			local entry = Instance.new("Folder", player)
			entry.Name = entryKey
			for variableKey, variableValue in variables do
				local type = typeof(variableValue) ~= "number" and "BoolValue" or "NumberValue"
				addVariable(type, entry, variableKey, variableValue)
			end
			if entryKey == "Attributes" then
				Attributes.Set(entry:GetChildren())
			end
			if entryKey == "Statistics" then
				Statistics.Set(entry:GetChildren())
			end
		end
		local data = Store:GetAsync(player.UserId) or DEFAULT_VARIABLES.Statistics
		for key, value in data do
			Statistics.Put(key, data[key])
		end
		Statistics.Put("totalVisits", data["totalVisits"] + 1)
		StatsGui.showStatsFrame(player)
		pcall(function()
			Store:SetAsync(player.UserId, data)
		end)
		game.OnClose = function()
			local stored = {}
			local statistics = Statistics.GetAll()
			for key in data do
				stored[key] = statistics[key].Value
			end
			pcall(function()
				Store:SetAsync(player.UserId, stored)
			end)
		end
	end)
end

Players.PlayerAdded:Connect(initialize)
