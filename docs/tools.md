---
sidebar_position: 3
---

# Player Tools & Equipment

Tools are items that can appear in a player's inventory and be equipped to perform
specific tasks. For example, an "Axe" tool might be placed in the [StarterPack](https://create.roblox.com/docs/reference/engine/classes/StarterPack) so
that players receive it upon joining the game and can use it to chop down trees.

To make a tool available in-game, store it as a replicable instance in [ReplicatedStorage](https://create.roblox.com/docs/reference/engine/classes/ReplicatedStorage)
and clone it into the player's inventory when needed.

You can create animations for tools using the [Animation Editor](https://create.roblox.com/docs/animation/editor)
and a compatible [Rig](https://create.roblox.com/docs/studio/rig-builder).
Once created, these animations can be configured to trigger in response to specific in-game events.

## Create

### Configuration

In `project/Tools.project.json` add the following section:

```json
{
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
}
```

### Script

Create your Tool in `src/Scripts/Tools/MyTool.server.luau` for example:

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
