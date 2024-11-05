--[=[
  @class Configuration
]=]
local DataStore = game:GetService("DataStoreService")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Attributes = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))
local Statistics = require(ReplicatedStorage.Variables:WaitForChild("Statistics"))
local StatsGui = require(ReplicatedStorage.Guis:WaitForChild("StatGui"))

local playerData = DataStore:GetDataStore("CampingStats_0.2.1")
local players = game:GetService("Players")

local function addToDataStore(
	className: "BoolValue" | "NumberValue" | "StringValue",
	folder: Folder,
	name: string,
	value: boolean | string | number
)
	local variable = Instance.new(className, folder)
	variable.Name = name
	variable.Value = value
end

local function addVariables(player: Player)
	local variables = Instance.new("Folder", player)
	variables.Name = "Attributes"
	addToDataStore("BoolValue", variables, "hasLog", false)
	addToDataStore("BoolValue", variables, "hasStone", false)
	addToDataStore("BoolValue", variables, "hasFlint", false)
	addToDataStore("BoolValue", variables, "hasAxe", false)
	addToDataStore("BoolValue", variables, "hasPick", false)
	addToDataStore("BoolValue", variables, "usingAxe", false)
	addToDataStore("BoolValue", variables, "usingPick", false)
	Attributes.Set(variables:GetChildren())
end

local function addStatistics(player: Player)
	local variables = Instance.new("Folder", player)
	variables.Name = "Statistics"
	addToDataStore("NumberValue", variables, "totalVisits", 0)
	addToDataStore("NumberValue", variables, "totalLogs", 0)
	addToDataStore("NumberValue", variables, "totalStones", 0)
	addToDataStore("NumberValue", variables, "totalFlints", 0)
	addToDataStore("NumberValue", variables, "totalPickSwings", 0)
	addToDataStore("NumberValue", variables, "totalAxeSwings", 0)
	Statistics.Set(variables:GetChildren())
end

players.PlayerAdded:Connect(function(player)
	player.CharacterAppearanceLoaded:Connect(function(character)
		addVariables(player)
		addStatistics(player)
		local totalVisits = Statistics.Get("totalVisits")
		Statistics.Put("totalVisits", totalVisits.Value + 1)
		local currentPlayerData = playerData:GetAsync(player.UserId)
		if currentPlayerData ~= nil then
			Statistics.Put("totalVisits", currentPlayerData["totalVisits"] + 1)
			Statistics.Put("totalLogs", currentPlayerData["totalLogs"])
			Statistics.Put("totalStones", currentPlayerData["totalStones"])
			Statistics.Put("totalFlints", currentPlayerData["totalFlints"])
			Statistics.Put("totalPickSwings", currentPlayerData["totalPickSwings"])
			Statistics.Put("totalAxeSwings", currentPlayerData["totalAxeSwings"])
			StatsGui.showStatsFrame(player)
		else
			currentPlayerData = {
				["totalVisits"] = 1,
				["totalLogs"] = 0,
				["totalStones"] = 0,
				["totalFlints"] = 0,
				["totalPickSwings"] = 0,
				["totalAxeSwings"] = 0,
			}
			local _success, _error = pcall(function()
				playerData:SetAsync(player.UserId, currentPlayerData)
			end)
		end

		game.OnClose = function()
			local stored = {}
			local statistics = Statistics.GetAll()
			for key in currentPlayerData do
				stored[key] = statistics[key].Value
			end
			local _success, _error = pcall(function()
				playerData:SetAsync(player.UserId, stored)
			end)
		end
	end)
end)
