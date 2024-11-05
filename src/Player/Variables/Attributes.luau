local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Persona = require(ReplicatedStorage.Toolkits:WaitForChild("Persona"))

--[=[
  The `Attributes` module securely manages [Player]-specific attributes, providing
  methods to _retrieve_, _set_, and _update_ these attributes through a controlled
  interface. 

  Integrating with the [Persona](/api/Persona) class, it accesses player data and
  organizes attributes within a private collection (`Attributes.attributes`).

  Methods allow flexible yet safe updates to individual or bulk attributes.

  :::warning 

  **Direct access on a private class property could lead to unexpected behaviour.**

  :::

  ## Usage

  ```lua
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local Attributes = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))

  print(Attributes.Get())
  ```

  @class Attributes
  @server
  @client
  @tag Variable Collection
]=]
local Attributes = {}

--- @type Entry { [string]: BoolValue }
--- @within Attributes
--- @private

--[=[
  @prop attributes { [string]: Entry }
  @within Attributes
  @private
]=]
Attributes.attributes = {}

--[=[
@within Attributes
@param name string
@return Entry
]=]
function Attributes.Get(name)
	local player = Persona.GetCurrentPlayer()
	if player then
		return player:WaitForChild("Attributes"):FindFirstChild(name)
	end
	local attributes = Attributes.GetAll()
	return attributes[name]
end

--[=[
  @within Attributes
  @return {Entry}
]=]
function Attributes.GetAll()
	local player = Persona.GetCurrentPlayer()
	if player then
		local attributes = player:WaitForChild("Attributes"):GetChildren()
		for _, attribute in attributes do
			Attributes.Put(attribute.Name, attribute)
		end
	end
	return Attributes.attributes
end

--[=[
  @param attributes {Entry} 
  @within Attributes
]=]
function Attributes.Set(attributes)
	local player = Persona.GetCurrentPlayer()
	for _, attribute in attributes do
		if player then
			local clientVariable = player:WaitForChild("Attributes"):FindFirstChild(attribute.Name)
			clientVariable.Value = attribute.Value
		end
		Attributes.attributes[attribute.Name] = attribute
	end
end

--[=[
  @within Attributes
  @param name string
  @param value boolean
]=]
function Attributes.Put(name: string, value: boolean)
	local player = Persona.GetCurrentPlayer()
	if player then
		local attribute = player:WaitForChild("Attributes"):FindFirstChild(name)
		attribute.Value = value
	end
	if not Attributes.attributes[name] then
		Attributes.attributes[name] = Instance.new("BoolValue")
	end
	Attributes.attributes[name].Name = name
	Attributes.attributes[name].Value = value
end

return Attributes
