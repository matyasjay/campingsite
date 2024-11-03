local DataStore: DataStoreService = game:GetService("DataStoreService")
local Variables = game:GetService("ReplicatedStorage").Variables
local PlayerVariables = require(Variables:WaitForChild("PlayerVariables"))

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

	return variables
end

local function addStatistics(player: Player)
	local Statistics = Instance.new("Folder", player)
	Statistics.Name = "Statistics"

	addToDataStore("NumberValue", Statistics, "totalVisits", 0)
	addToDataStore("NumberValue", Statistics, "totalLogs", 0)
	addToDataStore("NumberValue", Statistics, "totalStones", 0)
	addToDataStore("NumberValue", Statistics, "totalFlints", 0)
	addToDataStore("NumberValue", Statistics, "totalPickSwings", 0)
	addToDataStore("NumberValue", Statistics, "totalAxeSwings", 0)

	return Statistics
end

players.PlayerAdded:Connect(function(player)
	player.CharacterAppearanceLoaded:Connect(function(character)
		addVariables(player)

		local Statistics = addStatistics(player)

		Statistics.totalVisits.Value += 1

		local data = playerData:GetAsync(player.UserId)

		if data ~= nil then
			Statistics.totalVisits.Value = 1 + data["totalVisits"]
			Statistics.totalLogs.Value = data["totalLogs"]
			Statistics.totalStones.Value = data["totalStones"]
			Statistics.totalFlints.Value = data["totalFlints"]
			Statistics.totalPickSwings.Value = data["totalPickSwings"]
			Statistics.totalAxeSwings.Value = data["totalAxeSwings"]

			local Stats = {
				["Visits"] = Statistics.totalVisits.Value,
				["Logs"] = Statistics.totalLogs.Value,
				["Stones"] = Statistics.totalStones.Value,
				["Flints"] = Statistics.totalFlints.Value,
				["Pick Swings"] = Statistics.totalPickSwings.Value,
				["Axe Swings"] = Statistics.totalAxeSwings.Value,
			}

			local gui = player:WaitForChild("PlayerGui")
			local statsFrame = gui:WaitForChild("StatsGui"):WaitForChild("StatsFrame")

			for statLabel in Stats do
				local label = statsFrame:WaitForChild(statLabel)
				label.Text = `Total {statLabel}: {tostring(Stats[statLabel])}`
			end
		else
			data = {
				["totalVisits"] = 1,
				["totalLogs"] = 0,
				["totalStones"] = 0,
				["totalFlints"] = 0,
				["totalPickSwings"] = 0,
				["totalAxeSwings"] = 0,
			}

			local success, _error = pcall(function()
				playerData:SetAsync(player.UserId, data)
			end)

			if success then
				print(`Data setup for new player {player.Name} complete!`)
			else
				print(`Data setup for new player {player.Name} failed!`)
			end
		end

		game.OnClose = function()
			local dataToSave = {}
			for key in data do
				dataToSave[key] = Statistics[key].Value
			end
			local success, error = pcall(function()
				playerData:SetAsync(player.UserId, dataToSave)
			end)
			if success then
				print(`Data save for {player.Name} complete!`)
			elseif error then
				print(error)
			else
				print(`Data save for {player.Name} failed!`)
			end
		end
	end)
end)
