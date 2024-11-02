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
  The current [LocalPlayer] object

  @client
  @prop player Player
  @within Persona
  @private
]=]
Persona.player = nil

--[=[
  Get the current local [Player] object.

  @client
  @return Player -- The current [Player] object
]=]
function Persona.GetCurrentPlayer()
	local player = Persona.players.LocalPlayer
	if Persona.player == nil and player ~= nil then
		Persona.player = player
	end
	return Persona.player
end

--[=[
  Get the current local [Player#Character] object.

  @client
  @return Model -- The [Player#Character] model of the current [Player]
]=]
function Persona.GetCurrentCharacter()
	Persona.GetCurrentPlayer()
	return Persona.workspace:WaitForChild(Persona.player.Name)
end

--[=[
  Get the current [Player#Character] object from a [Player] object.

  @server
  @param player Player -- The [Player] to get the [Player#Character] from
  @return Model -- The [Player#Character] model of the given [Player]
]=]
function Persona.GetCharacterFromPlayer(player: Player)
	return Persona.workspace:WaitForChild(player.Name)
end

--[=[
  Get the [Humanoid] object of the current [Player].

  @client
  @return Humanoid -- The [Humanoid] object of the current [Player]
]=]
function Persona.GetCurrentHumanoid()
	return Persona.GetCurrentCharacter():WaitForChild("Humanoid")
end

--[=[
  Get a specific variable of the current [Player].

  @client
  @return {ValueBase} -- The [ValueBase] table of the current [Player]
]=]
function Persona.GetPlayerVariable(variable: string)
	Persona.GetCurrentPlayer()
	return Persona.player:WaitForChild(variable)
end
--
--[=[
  Get a specific variable of the current [Player].

  @server
  @param variable string -- The name of the requested variable
  @param player Player -- The [Player] object to get the variable from
  @return {ValueBase} -- The [ValueBase] table of the current [Player]
]=]
function Persona.GetPlayerVariableFromPlayer(variable: string, player: Player)
	return player:WaitForChild(variable)
end

return Persona
