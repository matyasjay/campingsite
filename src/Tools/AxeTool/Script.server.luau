local plrs = game:GetService("Players")
local tool = script.Parent

local function onEquip()
  local char = tool.Parent 
  local plr = plrs:FindFirstChild(char.name)
  local pVars = plr:WaitForChild("plrVars")
  local pHasAxe = pVars.hasAxe

  pHasAxe.Value = true
end


local function onUnequip()
  local plr = tool.Parent.Parent
  plr.plrVars.hasAxe.Value = false
end

tool.Equipped:Connect(onEquip)
tool.Unequipped:Connect(onUnequip)
