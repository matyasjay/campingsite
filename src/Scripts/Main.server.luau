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
  @server

  ## Usage

  ### `project/Tools.project.json`

  ```json
  "StarterPack": {
    "$className": "StarterPack",
    "$path": "src/Models/Player/StarterPack",

    "MyTool": {
      "$path": "src/Models/Tools/MyTool.rbxm",
      "Script": {
        "$path": "src/Scripts/Tools/MyTool.server.luau"
      }
    }
  }
  ```

  ### `src/Scripts/Tools/MyTool.server.luau`

  ```lua
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local AttributesConfig = require(ReplicatedStorage:WaitForChild("Attributes"))
  local AttributesVariable = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))

  local myTool = script.Parent

  local function onEquip()
    AttributesVariable.Put(AttributesConfig.Keys.HasAxe, true)
  end

  local function onUnequip()
    AttributesVariable.Put(AttributesConfig.Keys.HasAxe, false)
  end

  myTool.Equipped:Connect(onEquip)
  myTool.Unequipped:Connect(onUnequip)

  -- myTool.Activated:Connect(onActivate)
  -- myTool.Deactivated:Connect(onDeactivate)
  ```
]=]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Remote = require(ReplicatedStorage:WaitForChild("Remote"))

Players.PlayerAdded:Connect(Remote.Initialize)
