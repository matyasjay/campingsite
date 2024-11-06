--[=[
  @class Attributes Config
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
  @within Attributes Config
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

local PlayerAttributes = {}
PlayerAttributes.ValueType = "BoolValue"
PlayerAttributes.__index = PlayerAttributes

--[=[
  @prop Defaults { [string]: boolean | number  }
  @within Attributes Config
]=]
PlayerAttributes.Defaults = Utils.GetDefaultsFromStore(DEFAULT_ATTRIBUTES)

--[=[
  @prop Keys {string}
  @within Attributes Config
]=]
PlayerAttributes.Keys = Utils.GetKeysFromStore(DEFAULT_ATTRIBUTES)

return PlayerAttributes
