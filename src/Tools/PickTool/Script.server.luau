-- Pick Tool

local tool = script.Parent :: Tool
local ws = game:GetService("Workspace")
local ss = game:GetService("ServerStorage")
local camp = ws:WaitForChild("PlayArea").Camp
local rocks = camp.Rocks:GetChildren()
local flintPickup = ss:WaitForChild("Spawns").Flint
local stonePickup = ss:WaitForChild("Spawns").Stone
local plrs = game:GetService("Players")
local pickCount = {}
local db = true

local function onActivate()
  local char = tool.Parent 
  local plr = plrs:FindFirstChild(char.name)
  local pVars = plr:WaitForChild("plrVars")
  local pUsingPick = pVars.usingPick
  pUsingPick.Value = true

  for i=1, #rocks do
    if pickCount[i] == nil then
      pickCount[i] = 0
    end

    local rock = rocks[i]
    local target = (char.HumanoidRootPart.Position - rock.Position).Magnitude

    if target <= 6 then
      if pickCount[i] == 8 then
        pickCount[i] = 0
      else
        if db then
          db = false
          pickCount[i] += 1
        end
      end
    end
  end
end


local function onDeactivate()
  local char = tool.Parent
  local plr = plrs:FindFirstChild(char.Name)
  local pVars = plr:WaitForChild("plrVars")
  local pHasStone = pVars.hasStone
  local pHasFlint = pVars.hasFlint
  local pUsingPick = pVars.usingPick
  pUsingPick.Value = false

  for i=1, #rocks do
    local rock = rocks[i]
    local flintPicks = rock:GetAttribute("flintPicks")
    local stonePicks = rock:GetAttribute("stonePicks")
    if pickCount[i] == stonePicks and not pHasStone.Value then
      local newStone = stonePickup:Clone()
      newStone.Position = rock.Position + Vector3.new(5, 0, -5)
      newStone.Parent = ws
      newStone.Touched:Connect(function(hit)
        local hum = char:FindFirstChild("Humanoid")
        if hum and db then
          db = false
          if not pHasStone.Value then
            pHasStone.Value = true
            newStone:Destroy()
          else
            warn(`You already have a stone {plr.Name}`)
          end
          task.wait(2)
          db = true
        end
      end)
    end

    if pickCount[i] == flintPicks and not pHasFlint.Value then
      local newFlint = flintPickup:Clone()
      newFlint.Position = rock.Position + Vector3.new(-5, 0, 5)
      newFlint.Parent = ws
      newFlint.Touched:Connect(function(hit)
        local hum = char:FindFirstChild("Humanoid")
        if hum and db then
          db = false
          local pHasFlint = pVars.hasFlint
          if not pHasFlint.Value then
            pHasFlint.Value = true
            newFlint:Destroy()
          else
            warn(`You already have a flint {plr.Name}`)
          end
          task.wait(2)
          db = true
        end
      end)
    end
  end

  db = true
end

local function onEquip()
  local char = tool.Parent 
  local plr = plrs:FindFirstChild(char.name)
  local pVars = plr:WaitForChild("plrVars")
  local pHasPick = pVars.hasPick

  pHasPick.Value = true
end


local function onUnequip()
  local plr = tool.Parent.Parent
  plr.plrVars.hasPick.Value = false
end

tool.Equipped:Connect(onEquip)
tool.Unequipped:Connect(onUnequip)
tool.Activated:Connect(onActivate)
tool.Deactivated:Connect(onDeactivate)
