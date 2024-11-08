---
sidebar_position: 4
---

# Stats

## Usage

Setup the default "leaderstats" [Instance] in the Main script. The name has
to be "leaderstats" since this is a built-in feature

### Configuration

Configure the base stats in `src/Main.server.luau` as:

```lua

local leaderstats = Instance.new("Folder", player)
leaderstats.Name = "leaderstats"

local playerGold = Instance.new("NumberValue", leaderstats)
playerGold.Name = "Gold"
playerGold.Value = 0

while task.wait(1) do
  playerGold.Value += 10
end
```

### Update the stats

You can change a stat as needed, here's an example that increases the amount
of gold when the player touches `myItem`

In `src/Scripts/Items/MyItem.server.luau` you can have something similar:

```lua
local debounce = true
myItem.Touched:Connect(function(hit)
  local character = hit.Parent
  local humanoid = char:FindFirstChild("Humanoid")
  local plr = game.Players:FindFirstChild(character.Name)
  if humanoid and debounce then
    debounce = false
    local pStats = plr:WaitForChild("leaderstats")
    local pGold = pStats.Gold
    pGold.Value += 10
    task.wait(1)
    debounce = true
end)
```
