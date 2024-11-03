--[=[
  @type Variable {Name: string, Value: boolean | string | number}
  @within PlayerStatistics
]=]

local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Persona = require(Toolkits:WaitForChild("Persona"))

--[=[
  This is a collection of player statistic values. The variables stored in this
  class should not affect the player experience instead provide analytics and 
  could be used to showcase achievements or other related data.

  @class PlayerStatistics
  @tag Variable Collection
]=]
local PlayerStatistics = {}

--[=[
  @prop variables {Variable}
  @within PlayerStatistics
]=]
PlayerStatistics.variables = {}

function PlayerStatistics.GetVariables()
	local player = Persona.GetCurrentPlayer()

	if player then
		local clientVars = player:WaitForChild("Variables"):GetChildren()
		PlayerStatistics.SetVariables(clientVars)
	end

	return PlayerStatistics.variables
end

function PlayerStatistics.SetVariables(variables: SharedTable)
	PlayerStatistics.variables = variables
	return variables
end

function PlayerStatistics.GetVariable(name: string)
	local variable = PlayerStatistics.variables[name] or { Name = name, Value = 0 }
	return variable
end

function PlayerStatistics.SetVariable(name: string, value: boolean | number | string)
	if not PlayerStatistics.variables[name] then
		PlayerStatistics.variables[name] = {}
	end
	PlayerStatistics.variables[name].Name = name
	PlayerStatistics.variables[name].Value = value
	return PlayerStatistics.variables[name]
end

return PlayerStatistics
