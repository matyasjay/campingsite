local tool = script.Parent

local function onEquip()
  print("Pick Equiped")
end


local function onUnequip()
  print("Pick Unequiped")
end

tool.Equipped:Connect(onEquip)
tool.Unequipped:Connect(onUnequip)
