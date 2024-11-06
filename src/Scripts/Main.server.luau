--[=[
  @class Introduction

  This is the current version of the technical documentation for the 
  [Campingsite](https://github.com/matyasjay/campingsite) developer sandbox project.

  :::note
  The website is the output of an automated `Lua` documentation generator process.
  The class, prop and function signatures defined are based on inline code block
  comments. See [Moonwave](https://eryn.io/moonwave) for more details.
  :::
]=]

--[=[
  @class Tools

  ## Usage
  ```lua
  -- src/Scripts/Tools/MyTool.luau

  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local AttributesConfig = require(ReplicatedStorage:WaitForChild("Attributes"))
  local AttributesVariable = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))

  local axeTool = script.Parent
  local player = axeTool.Parent.Parent

  local function onEquip()
    AttributesVariable.Put(AttributesConfig.Keys.HasAxe, true)
  end

  local function onUnequip()
    AttributesVariable.Put(AttributesConfig.Keys.HasAxe, false)
  end

  axeTool.Equipped:Connect(onEquip)
  axeTool.Unequipped:Connect(onUnequip)

  -- axeTool.Activated:Connect(onActivate)
  -- axeTool.Deactivated:Connect(onDeactivate)
  ```
]=]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Remote = require(ReplicatedStorage:WaitForChild("Remote"))

Players.PlayerAdded:Connect(Remote.Initialize)
