local players = game:GetService("Players")
local workspace = game:GetService("Workspace")

--[=[
  @class Players
  @tag Toolkit
]=]
local Players = {}

--[=[
  Get the current local player object.

  @return Player -- The current player object
]=]
function Players.GetCurrentPlayer()
	local player = players.LocalPlayer
	return player
end

--[=[
  Get the humanoid object of the current player.

  @return Humanoid -- The humanoid object of the current player
]=]
function Players.GetCurrentHumanoid()
	local player = Players.GetCurrentPlayer()
	local character = workspace:FindFirstChild(player.Name)
	return character:WaitForChild("Humanoid")
end

return Players
