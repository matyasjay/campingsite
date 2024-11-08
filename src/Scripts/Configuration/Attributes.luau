--[=[
  @class AttributesConfig
  @tag Player Variables
  @tag Configuration

  # Usage

  ```lua
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local AttributesConfig = require(ReplicatedStorage:WaitForChild("Attributes"))
  local configKeys = Attributes Config.Keys
  ```
]=]

--[=[
  @prop DefaultAttributes { string }
  @readonly
  @within AttributesConfig
]=]
local DEFAULT_ATTRIBUTES = {
	["HasLog"] = false,
	["HasStone"] = false,
	["HasFlint"] = false,
	["HasAxe"] = false,
	["HasPick"] = false,
	["UsingAxe"] = false,
	["UsingPick"] = false,
}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Utils = require(ReplicatedStorage:WaitForChild("Utils"))

local AttributesConfig = {}
AttributesConfig.ValueType = "BoolValue"
AttributesConfig.__index = AttributesConfig

--[=[
  @prop Defaults { [string]: boolean | number  }
  @within AttributesConfig
]=]
AttributesConfig.Defaults = Utils.GetDefaultsFromStore(DEFAULT_ATTRIBUTES)

--[=[
  @prop Keys {string}
  @within AttributesConfig
]=]
AttributesConfig.Keys = Utils.GetKeysFromStore(DEFAULT_ATTRIBUTES)

return AttributesConfig
