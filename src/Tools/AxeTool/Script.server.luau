local axeTool = script.Parent
local player = axeTool.Parent.Parent

local Workspace = game:GetService("Workspace")
local ServerStorage = game:GetService("ServerStorage")
local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Persona = require(Toolkits:WaitForChild("Persona"))
local Iterator = require(Toolkits:WaitForChild("Iterator"))
local Character = Persona.GetCharacterFromPlayer(player)
local Variables = Persona.GetPlayerVariableFromPlayer("Variables", player)
local Statistics = Persona.GetPlayerVariableFromPlayer("Statistics", player)

local camp = Workspace:WaitForChild("PlayArea").Camp
local trees = camp.Trees:GetChildren()
local pitCount = camp.FirePit.PitBase:GetAttribute("logCount")

local chopCount = {}
local needWood = true
local debouncePickup = true
local debounceAnimation = true

local function chopTreeWhenPossible(tree, index)
	local target = (Character.HumanoidRootPart.Position - tree.Trunk.Position).Magnitude
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
			if not Variables.hasLog.Value then
				Variables.hasLog.Value = true
				Statistics.totalLogs.Value += 1
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
		pitCount = camp.FirePit.PitBase:GetAttribute("logCount")
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
		Statistics.totalAxeSwings.Value += 1
		Iterator.WalkModels(trees, chopTreeWhenPossible)
		Variables.usingAxe.Value = true
	end
end

local function onDeactivate()
	if debounceAnimation then
		Variables.usingAxe.Value = false
		debounceAnimation = false
		Iterator.WalkModels(trees, spawnLogWhenPossible)
		task.wait(1)
		debounceAnimation = true
	end
end

local function onEquip()
	Variables.hasAxe.Value = true
end

local function onUnequip()
	Variables.hasAxe.Value = false
end

axeTool.Equipped:Connect(onEquip)
axeTool.Unequipped:Connect(onUnequip)
axeTool.Activated:Connect(onActivate)
axeTool.Deactivated:Connect(onDeactivate)
