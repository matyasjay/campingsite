local tool = script.Parent

local function onEquip()
  print("Axe Equiped")
end


local function onUnequip()
  print("Axe Unequiped")
end

tool.Equipped:Connect(onEquip)
tool.Unequipped:Connect(onUnequip)
