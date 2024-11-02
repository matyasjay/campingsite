local datastore: DataStoreService = game:GetService("DataStoreService")
local plrData = datastore:GetDataStore("CampingStats_0.2.0")
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
			-- TODO: prolly refactor with loops?
			plrTotalVisits.Value = 1 + data["plrTotalVisits"]
			plrLogsChopped.Value = data["plrLogsChopped"]
			plrStonesPicked.Value = data["plrStonesPicked"]
			plrFlintsPicked.Value = data["plrFlintsPicked"]
			plrPickSwings.Value = data["plrPickSwings"]
			plrAxeSwings.Value = data["plrAxeSwings"]

			local gui = player:WaitForChild("PlayerGui")
			local statsFrame = gui:WaitForChild("StatsGui"):WaitForChild("StatsFrame")
			local visitsLabel = statsFrame:WaitForChild("Visits")
			visitsLabel.Text = "Total Visits: " .. tostring(plrTotalVisits.Value)
			local logsLabel = statsFrame:WaitForChild("Logs")
			logsLabel.Text = "Total Logs: " .. tostring(plrLogsChopped.Value)
			local stonesLabel = statsFrame:WaitForChild("Stones")
			stonesLabel.Text = "Total Stones: " .. tostring(plrStonesPicked.Value)
			local flintsLabel = statsFrame:WaitForChild("Flints")
			flintsLabel.Text = "Total Flints: " .. tostring(plrFlintsPicked.Value)
			local axeSwingsLabel = statsFrame:WaitForChild("Axe Swings")
			axeSwingsLabel.Text = "Total Axe Swings: " .. tostring(plrAxeSwings.Value)
			local pickSwingsLabel = statsFrame:WaitForChild("Pick Swings")
			pickSwingsLabel.Text = "Total Pick Swings: " .. tostring(plrPickSwings.Value)
		else
			data = {
				["plrTotalVisits"] = 1,
				["plrLogsChopped"] = 0,
				["plrStonesPicked"] = 0,
				["plrFlintsPicked"] = 0,
				["plrPickSwings"] = 0,
				["plrAxeSwings"] = 0,
			}

			local success, _error = pcall(function()
				plrData:SetAsync(player.UserId, data)
			end)

			if success then
				print(`Data setup for new player {player.Name} complete!`)
			else
				print(`Data setup for new player {player.Name} failed!`)
			end
		end

		game.OnClose = function()
			local dataToSave = {
				["plrTotalVisits"] = plrTotalVisits.Value,
				["plrLogsChopped"] = plrLogsChopped.Value,
				["plrStonesPicked"] = plrStonesPicked.Value,
				["plrFlintsPicked"] = plrFlintsPicked.Value,
				["plrPickSwings"] = plrPickSwings.Value,
				["plrAxeSwings"] = plrAxeSwings.Value,
			}

			local success, _error = pcall(function()
				plrData:SetAsync(player.UserId, dataToSave)
			end)

			if success then
				print(`Data save for {player.Name} complete!`)
			else
				print(`Data save for {player.Name} failed!`)
			end
		end
	end)
end)
