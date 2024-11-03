local DataStore: DataStoreService = game:GetService("DataStoreService")
local Guis = game:GetService("ReplicatedStorage").Guis
local StatsGui = require(Guis:WaitForChild("StatGui"))
local Variables = game:GetService("ReplicatedStorage").Variables
local PlayerVariables = require(Variables:WaitForChild("PlayerVariables"))
local PlayerStatistics = require(Variables:WaitForChild("PlayerStatistics"))

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
	variables.Name = "Variables"
	addToDataStore("BoolValue", variables, "hasLog", false)
	addToDataStore("BoolValue", variables, "hasStone", false)
	addToDataStore("BoolValue", variables, "hasFlint", false)
	addToDataStore("BoolValue", variables, "hasAxe", false)
	addToDataStore("BoolValue", variables, "hasPick", false)
	addToDataStore("BoolValue", variables, "usingAxe", false)
	addToDataStore("BoolValue", variables, "usingPick", false)
	PlayerVariables.SetVariables(variables:GetChildren())
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
	PlayerStatistics.SetVariables(variables:GetChildren())
end

players.PlayerAdded:Connect(function(player)
	player.CharacterAppearanceLoaded:Connect(function(character)
		addVariables(player)
		addStatistics(player)
		local totalVisits = PlayerStatistics.GetVariable("totalVisits")
		PlayerStatistics.SetVariable("totalVisits", totalVisits.Value + 1)
		local data = playerData:GetAsync(player.UserId)
		if data ~= nil then
			PlayerStatistics.SetVariable("totalVisits", data["totalVisits"] + 1)
			PlayerStatistics.SetVariable("totalLogs", data["totalLogs"])
			PlayerStatistics.SetVariable("totalStones", data["totalStones"])
			PlayerStatistics.SetVariable("totalFlints", data["totalFlints"])
			PlayerStatistics.SetVariable("totalPickSwings", data["totalPickSwings"])
			PlayerStatistics.SetVariable("totalAxeSwings", data["totalAxeSwings"])
			StatsGui.showStatsFrame(player)
		else
			data = {
				["totalVisits"] = 1,
				["totalLogs"] = 0,
				["totalStones"] = 0,
				["totalFlints"] = 0,
				["totalPickSwings"] = 0,
				["totalAxeSwings"] = 0,
			}
			local _success, _error = pcall(function()
				playerData:SetAsync(player.UserId, data)
			end)
		end

		game.OnClose = function()
			local dataToSave = {}
			local statistics = PlayerStatistics.GetVariables()
			for key in data do
				dataToSave[key] = statistics[key].Value
			end
			local _success, _error = pcall(function()
				playerData:SetAsync(player.UserId, dataToSave)
			end)
		end
	end)
end)
