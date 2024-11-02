--[=[
  This class provides utilities to access the player pool of all the [Players] or get the current [Player]
  and their decendants (i.e: [Humanoid], [Player#Character]...etc) without too much boilerplate.

  @class Persona
  @tag Toolkit
]=]
local Persona = {}

--[=[
  The [Players] that are currently available in the game

  @prop players Players
  @within Persona
  @private
]=]
Persona.players = game:GetService("Players")

--[=[
  The current [Workspace] object

  @prop workspace Workspace
  @within Persona
  @private
]=]
Persona.workspace = game:GetService("Workspace")

--[=[
  Get the current local [Player] object.

  @client
  @return Player -- The current [Player] object
]=]
function Persona.GetCurrentPlayer()
	local player = Persona.players.LocalPlayer
	return player
end

--[=[
  Get the current local [Player#Character] object.

  @client
  @return Model -- The [Player#Character] model of the current [Player]
]=]
function Persona.GetCurrentCharacter()
	local player = Persona.GetCurrentPlayer()
	local character = Persona.workspace:FindFirstChild(player.Name)
	return character
end

--[=[
  Get the [Humanoid] object of the current [Player].

  @client
  @return Humanoid -- The [Humanoid] object of the current [Player]
]=]
function Persona.GetCurrentHumanoid()
	local character = Persona.GetCurrentCharacter()
	return character:WaitForChild("Humanoid")
end

return Persona
