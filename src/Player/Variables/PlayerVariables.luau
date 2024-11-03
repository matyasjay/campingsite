--[=[
  @type Variable {{Name: string, Value: boolean | string | number}}
  @within PlayerVariables
]=]

local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Persona = require(Toolkits:WaitForChild("Persona"))

--[=[
  This class represents the collection of in-game variables of a given player.
  The values of the variables are used to determine events or trigger actions
  based on the results. You can use the getter/setter method on either realm
  (client or server) to mutate the variables but they need to be handled separately.

  @class PlayerVariables
  @tag Variable Collection
]=]
local PlayerVariables = {}

--[=[
  The loaded player variables either on client or server side.
  Note, that the current realm needs to be setup first and is not synced with
  each other.
  
  @prop variables Variable
  @within PlayerVariables
]=]
PlayerVariables.variables = {}

function PlayerVariables.GetVariables()
	local player = Persona.GetCurrentPlayer()

	if player then
		local clientVars = player:WaitForChild("Variables"):GetChildren()
		PlayerVariables.SetVariables(clientVars)
	end

	return PlayerVariables.variables
end

function PlayerVariables.SetVariables(variables: SharedTable)
	PlayerVariables.variables = variables
	return variables
end

function PlayerVariables.GetVariable(name: string)
	local variable = PlayerVariables.variables[name]
	return variable
end

function PlayerVariables.SetVariable(name: string, value: boolean | number | string)
	PlayerVariables.variables[name] = {}
	PlayerVariables.variables[name].Name = name
	PlayerVariables.variables[name].Value = value
	return PlayerVariables.variables[name]
end

return PlayerVariables
