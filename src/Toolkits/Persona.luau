--[=[
  This class provides utilities to access the localPlayer pool of all the [Players] or get the current [Player]
  and their decendants (i.e: [Humanoid], [Player#Character]...etc) without too much boilerplate.

  @class Persona
  @tag Toolkit
]=]
local Persona = {}

--[=[
  Get all [Player] objects that are currently in the game.

  @return {Player} -- The table of online [Player] objects
]=]
function Persona.GetPlayers()
	local players = game:GetService("Players"):GetChildren()
	return players :: { Player }
end

--[=[
  Get the current local [Player] object.

  @client
  @return Player -- The current [Player] object
]=]
function Persona.GetCurrentPlayer()
	local player = game:GetService("Players").LocalPlayer
	return player
end

--[=[
  Get the current local [Player#Character] object.

  @client
  @return Model -- The [Player#Character] model of the current [Player]
]=]
function Persona.GetCurrentCharacter()
	local workspace = game:GetService("Workspace")
	local player = Persona.GetCurrentPlayer()
	return workspace:WaitForChild(player.Name)
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

--[=[
  Get a specific variable of the current [Player].

  @client
  @param variable string -- The name of the current [Player]'s variable
  @return {ValueBase} -- The [ValueBase] table of the current [Player]
]=]
function Persona.GetPlayerVariable(variable: string)
	local player = Persona.GetCurrentPlayer()
	return player:WaitForChild(variable)
end

--[=[
  Get the [Player#Character] object from a [Player] object.

  @param player Player -- The [Player] to get the [Player#Character] from
  @return Model -- The [Player#Character] model of the given [Player]
]=]
function Persona.GetCharacterFromPlayer(player: Player)
	local workspace = game:GetService("Workspace")
	return workspace:WaitForChild(player.Name)
end

--[=[
  Get the [Player] object from a [Player#Character] object.

  @param character Model -- The [Player#Character] to get the [Player] from
  @return Player -- The [Player] object of the given [Player#Character]
]=]
function Persona.GetPlayerFromCharacter(character: Model)
	local currentPlayer
	local players = Persona.GetPlayers()
	for _, player in players do
		if player.Name == character.Name then
			currentPlayer = player
		end
	end
	return currentPlayer
end

--[=[
  Get a specific variable of the given [Player] object.

  @param variable string -- The name of the requested variable
  @param player Player -- The [Player] object to get the variable from
  @return {ValueBase} -- The [ValueBase] table of the current [Player]
]=]
function Persona.GetPlayerVariableFromPlayer(variable: string, player: Player)
	return player:WaitForChild(variable)
end

return Persona
