--[=[
  @prop AxeTool Model
  @tag Player Item
  @tag Main Script
  @within Tools
]=]

local axeTool = script.Parent
local player = axeTool.Parent.Parent

local Workspace = game:GetService("Workspace")
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Persona = require(ReplicatedStorage.Toolkits:WaitForChild("Persona"))
local Iterator = require(ReplicatedStorage.Toolkits:WaitForChild("Iterator"))
local AttributesConfig = require(ReplicatedStorage:WaitForChild("Attributes"))
local AttributesVariable = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))
local StatisticsConfig = require(ReplicatedStorage:WaitForChild("Statistics"))
local StatisticsVariable = require(ReplicatedStorage.Variables:WaitForChild("Statistics"))

local character = Persona.GetCharacterFromPlayer(player)
local camp = Workspace:WaitForChild("PlayArea").Camp
local trees = camp.Trees:GetChildren()
local pitCount = camp.FirePit.PitBase:GetAttribute("logs")

local chopCount = {}
local needWood = true
local debouncePickup = true
local debounceAnimation = true

local function chopTreeWhenPossible(tree, index)
	local target = (character.HumanoidRootPart.Position - tree.Trunk.Position).Magnitude
	if chopCount[index] == nil then
		chopCount[index] = 0
	end
	if target < 5 then
		local chopsNeeded = tree.Trunk:GetAttribute("numOfChops")
		if chopCount[index] == chopsNeeded then
			chopCount[index] = 0
		else
			chopCount[index] = chopCount[index] + 1
		end
	end
end

local function pickupLog(log: Part)
	return function(basePart: BasePart)
		local isHumanoid = (basePart.Parent :: Player):FindFirstChild("Humanoid")
		if isHumanoid and debouncePickup then
			debouncePickup = false
			local hasLog = AttributesVariable.Get(AttributesConfig.Keys.HasLog).Value
			if not hasLog then
				AttributesVariable.Put(AttributesConfig.Keys.HasLog, true)
				StatisticsVariable.Put(
					StatisticsConfig.Keys.TotalLogs,
					StatisticsVariable.Get(StatisticsConfig.Keys.TotalLogs).Value + 1
				)
				log:Destroy()
			end
			task.wait(2)
			debouncePickup = true
		end
	end
end

local function spawnLogWhenPossible(tree, index)
	local logSpawn = ServerStorage:WaitForChild("Spawns").Log
	local logSpawnPlace = tree.LogSpawn
	local chopsNeeded = tree.Trunk:GetAttribute("numOfChops")
	if chopCount[index] == chopsNeeded and needWood then
		chopCount[index] = 0
		pitCount = camp.FirePit.PitBase:GetAttribute("logs")
		if pitCount == 2 then
			needWood = false
		end
		local newLog = logSpawn:Clone()
		newLog.CFrame = logSpawnPlace.CFrame
		newLog.Parent = Workspace
		newLog.Touched:Connect(pickupLog(newLog))
	end
end

local function onActivate()
	if debounceAnimation then
		StatisticsVariable.Put(
			StatisticsConfig.Keys.TotalAxeSwings,
			StatisticsVariable.Get(StatisticsConfig.Keys.TotalAxeSwings).Value + 1
		)
		Iterator.WalkModels(trees, chopTreeWhenPossible)
		AttributesVariable.Put(AttributesConfig.Keys.UsingAxe, true)
	end
end

local function onDeactivate()
	if debounceAnimation then
		AttributesVariable.Put(AttributesConfig.Keys.UsingAxe, false)
		debounceAnimation = false
		Iterator.WalkModels(trees, spawnLogWhenPossible)
		task.wait(1)
		debounceAnimation = true
	end
end

local function onEquip()
	AttributesVariable.Put(AttributesConfig.Keys.HasAxe, true)
end

local function onUnequip()
	AttributesVariable.Put(AttributesConfig.Keys.HasAxe, false)
end

axeTool.Equipped:Connect(onEquip)
axeTool.Unequipped:Connect(onUnequip)
axeTool.Activated:Connect(onActivate)
axeTool.Deactivated:Connect(onDeactivate)
