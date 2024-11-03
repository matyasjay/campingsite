local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Persona = require(Toolkits:WaitForChild("Persona"))

--[=[
  This class represents the collection of in-game variables of a given [Player].
  The values of the variables are used to determine events or trigger actions.
  You can use the getter/setter method on regardless of the
  current realm (client or server) to mutate the variables. 

  @class PlayerVariables
  @tag Variable Collection
]=]
local PlayerVariables = {}

--[=[
  The current [Player] variables either on client or server side. The records
  in this table are synced between server and client in the class implementation
  and no need to keep attention where you access them.
  
  @prop variables {BoolValue}
  @within PlayerVariables
]=]
PlayerVariables.variables = {} :: { [string]: BoolValue }

function PlayerVariables.GetVariables()
	local player = Persona.GetCurrentPlayer()
	if player then
		local variables = player:WaitForChild("Variables"):GetChildren() :: { [number]: BoolValue }
		for _, variable in variables do
			PlayerVariables.SetVariable(variable.Name, variable)
		end
	end
	return PlayerVariables.variables
end

function PlayerVariables.SetVariables(variables)
	local player = Persona.GetCurrentPlayer()
	for _, variable in variables do
		if player then
			local clientVariable = player:WaitForChild("Variables"):FindFirstChild(variable.Name)
			clientVariable.Value = variable.Value
		end
		PlayerVariables.variables[variable.Name] = variable
	end
end

function PlayerVariables.GetVariable(name: string)
	local player = Persona.GetCurrentPlayer()
	if player then
		return player:WaitForChild("Variables"):FindFirstChild(name)
	end
	local variables = PlayerVariables.GetVariables()
	return variables[name]
end

function PlayerVariables.SetVariable(name: string, value: boolean | number | string)
	local player = Persona.GetCurrentPlayer()
	if player then
		local variable = player:WaitForChild("Variables"):FindFirstChild(name)
		variable.Value = value
	end
	if not PlayerVariables.variables[name] then
		PlayerVariables.variables[name] = Instance.new("BoolValue")
	end
	PlayerVariables.variables[name].Name = name
	PlayerVariables.variables[name].Value = value
end

return PlayerVariables
