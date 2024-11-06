--[=[
  @class Statistics
  @tag Player Variables
  @tag Variable Collection

  The `Statistics` module securely manages [Player]-specific attributes, providing
  methods to _retrieve_, _set_, and _update_ these attributes through a controlled
  interface. 

  Integrating with the [Persona](/api/Persona) class, it accesses player data and
  organizes attributes within a private collection (`Statistics.attributes`).

  Methods allow flexible yet safe updates to individual or bulk attributes.

  :::warning 

  **Direct access on a private class property could lead to unexpected behaviour.**

  :::

  ## Usage

  ```lua
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local Statistics = require(ReplicatedStorage.Variables:WaitForChild("Statistics"))

  print(Statistics.Get())
  ```
]=]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StatisticsConfig = require(ReplicatedStorage:WaitForChild("Statistics"))
local Persona = require(ReplicatedStorage.Toolkits:WaitForChild("Persona"))

local Statistics = {}

Statistics.Name = "Statistics"

--- @type Entry { [string]: NumberValue }
--- @within Statistics
--- @private

--[=[
  @prop attributes { [string]: Entry }
  @within Statistics
  @private
]=]
Statistics.attributes = StatisticsConfig.Defaults

--[=[
@within Statistics
@param name string
@return Entry
]=]
function Statistics.Get(name)
	local player = Persona.GetCurrentPlayer()
	if player then
		return player:WaitForChild("Statistics"):FindFirstChild(name)
	end
	local attributes = Statistics.GetAll()
	return attributes[name]
end

--[=[
  @within Statistics
  @return {Entry}
]=]
function Statistics.GetAll()
	local player = Persona.GetCurrentPlayer()
	if player then
		local attributes = player:WaitForChild("Statistics"):GetChildren()
		for _, attribute in attributes do
			Statistics.Put(attribute.Name, attribute.Value)
		end
	end
	return Statistics.attributes
end

--[=[
  @param attributes {Entry} 
  @within Statistics
]=]
function Statistics.Set(attributes)
	local player = Persona.GetCurrentPlayer()
	for _, attribute in attributes do
		if player then
			local clientVariable = player:WaitForChild("Statistics"):FindFirstChild(attribute.Name)
			clientVariable.Value = attribute.Value
		end
		Statistics.attributes[attribute.Name] = attribute
	end
end

--[=[
  @within Statistics
  @param name string
  @param value number
]=]
function Statistics.Put(name: string, value: number)
	local player = Persona.GetCurrentPlayer()
	if player then
		local attribute = player:WaitForChild("Statistics"):FindFirstChild(name)
		attribute.Value = value
	end
	if not Statistics.attributes[name] then
		Statistics.attributes[name] = Instance.new("NumberValue")
	end
	Statistics.attributes[name].Name = name
	Statistics.attributes[name].Value = value
end

return Statistics
