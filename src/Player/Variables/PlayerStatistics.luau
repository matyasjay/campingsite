local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Persona = require(Toolkits:WaitForChild("Persona"))

local PlayerStatistics = {}

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
	local variable = PlayerStatistics.variables[name]
	return variable
end

function PlayerStatistics.SetVariable(name: string, value: boolean | number | string)
	PlayerStatistics.variables[name] = {}
	PlayerStatistics.variables[name].Name = name
	PlayerStatistics.variables[name].Value = value
	return PlayerStatistics.variables[name]
end

return PlayerStatistics
