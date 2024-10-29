local players: Players = game:GetService("Players")

players.PlayerAdded:Connect(function(player)
	player.CharacterAppearanceLoaded:Connect(function(character)
		local playerVars = Instance.new("Folder", player)
		playerVars.Name = "plrVars"

		local plrHasLog = Instance.new("BoolValue", playerVars)
		plrHasLog.Name = "hasLog"
		plrHasLog.Value = false

		local plrHasStone = Instance.new("BoolValue", playerVars)
		plrHasStone.Name = "hasStone"
		plrHasStone.Value = false

		local plrHasFlint = Instance.new("BoolValue", playerVars)
		plrHasFlint.Name = "hasFlint"
		plrHasFlint.Value = false

		local plrHasAxe = Instance.new("BoolValue", playerVars)
		plrHasAxe.Name = "hasAxe"
		plrHasAxe.Value = false

		local plrHasPick = Instance.new("BoolValue", playerVars)
		plrHasPick.Name = "hasPick"
		plrHasPick.Value = false

		local plrUsingAxe = Instance.new("BoolValue", playerVars)
		plrUsingAxe.Name = "usingAxe"
		plrUsingAxe.Value = false

		local plrUsingPick = Instance.new("BoolValue", playerVars)
		plrUsingPick.Name = "usingPick"
		plrUsingPick.Value = false
	end)
end)
