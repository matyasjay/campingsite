local dss: DataStoreService = game:GetService("DataStoreService")
local plrData = dss:GetDataStore("CampingStats_0.2.0")
local players: Players = game:GetService("Players")

players.PlayerAdded:Connect(function(player)
	player.CharacterAppearanceLoaded:Connect(function(character)
		local plrVars = Instance.new("Folder", player)
		plrVars.Name = "plrVars"

		-- Resources

		local plrHasLog = Instance.new("BoolValue", plrVars)
		plrHasLog.Name = "hasLog"
		plrHasLog.Value = false

		local plrHasStone = Instance.new("BoolValue", plrVars)
		plrHasStone.Name = "hasStone"
		plrHasStone.Value = false

		local plrHasFlint = Instance.new("BoolValue", plrVars)
		plrHasFlint.Name = "hasFlint"
		plrHasFlint.Value = false

		-- Tools

		local plrHasAxe = Instance.new("BoolValue", plrVars)
		plrHasAxe.Name = "hasAxe"
		plrHasAxe.Value = false

		local plrHasPick = Instance.new("BoolValue", plrVars)
		plrHasPick.Name = "hasPick"
		plrHasPick.Value = false

		local plrUsingAxe = Instance.new("BoolValue", plrVars)
		plrUsingAxe.Name = "usingAxe"
		plrUsingAxe.Value = false

		local plrUsingPick = Instance.new("BoolValue", plrVars)
		plrUsingPick.Name = "usingPick"
		plrUsingPick.Value = false

		-- Analytics

		local plrTotalVisits = Instance.new("NumberValue", plrVars)
		plrTotalVisits.Name = "totVisits"
		plrTotalVisits.Value = 0

		local plrLogsChopped = Instance.new("NumberValue", plrVars)
		plrLogsChopped.Name = "totLogs"
		plrLogsChopped.Value = 0

		local plrStonesPicked = Instance.new("NumberValue", plrVars)
		plrStonesPicked.Name = "totStones"
		plrStonesPicked.Value = 0

		local plrFlintsPicked = Instance.new("NumberValue", plrVars)
		plrFlintsPicked.Name = "totFlints"
		plrFlintsPicked.Value = 0

		local plrPickSwings = Instance.new("NumberValue", plrVars)
		plrPickSwings.Name = "totPickSwings"
		plrPickSwings.Value = 0

		local plrAxeSwings = Instance.new("NumberValue", plrVars)
		plrAxeSwings.Name = "totAxeSwings"
		plrAxeSwings.Value = 0

		-- Initialise

		plrTotalVisits.Value += 1

		-- Datastores

		local data = plrData:GetAsync(player.UserId)

		if data ~= nil then
			print(`Data loaded for existing player {player.Name} successfully!`)
			print(data)
		else
			data = {
				["plrTotalVisits"] = 1,
				["plrLogsChopped"] = 0,
				["plrStonesPicked"] = 0,
				["plrFlintsPicked"] = 0,
				["plrPickSwings"] = 0,
				["plrAxeSwings"] = 0,
			}

			local success, error = pcall(function()
				plrData:SetAsync(player.UserId, data)
			end)

			if success then
				print(`Data setup for new player {player.Name} complete!`)
			else
				print(`Data setup for new player {player.Name} failed!`)
			end
		end
	end)
end)
