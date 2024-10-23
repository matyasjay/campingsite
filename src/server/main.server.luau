local players: Players = game:GetService("Players")

players.PlayerAdded:Connect(function(player)
  player.CharacterAppearanceLoaded:Connect(function(character)
    local playerVars = Instance.new("Folder", player) 
    playerVars.Name = "plrVars"

    local plrHasLog = Instance.new("BoolValue", playerVars)
    plrHasLog.Name = "hasLog"
    plrHasLog.Value = false
  end)
end)

