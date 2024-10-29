-- Pick Tool

local plrs = game:GetService("Players")
local tool = script.Parent :: Tool

local function onActivate()
  local char = tool.Parent 
  local plr = plrs:FindFirstChild(char.name)
  local pVars = plr:WaitForChild("plrVars")
  local pUsingPick = pVars.usingPick

  pUsingPick.Value = true
end


local function onDeactivate()
  local char = tool.Parent
  local plr = plrs:FindFirstChild(char.Name)
  local pVars = plr:WaitForChild("plrVars")
  local pUsingPick = pVars.usingPick
  pUsingPick.Value = false
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
