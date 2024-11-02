-- Axe Tool

local Workspace = game:GetService("Workspace")
local ServerStorage = game:GetService("ServerStorage")
local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Persona = require(Toolkits:WaitForChild("Persona"))

local tool = script.Parent
local player = tool.Parent.Parent
local Character = Persona.GetCharacterFromPlayer(player)
local Variables = Persona.GetPlayerVariableFromPlayer("plrVars", player)

local logPickup = ServerStorage:WaitForChild("Spawns").Log
local camp = Workspace:WaitForChild("PlayArea").Camp
local trees = camp.Trees:GetChildren()
local pitCount = camp.FirePit.PitBase:GetAttribute("logCount")
local chopCount = {}
local needWood = true
local debouncePickup = true
local debounceAnimation = true

local function walkTrees(callback: (tree: Model, index: number) -> ())
	for index = 1, #trees do
		local tree = trees[index]
		callback(tree, index)
	end
end

local function onActivate()
	if debounceAnimation then
		local isUsingAxe = Variables.usingAxe
		local totalSwings = Variables.totAxeSwings
		totalSwings.Value += 1
		walkTrees(function(tree, index)
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
		end)
		isUsingAxe.Value = true
	end
end

local function onDeactivate()
	local isUsingAxe = Variables.usingAxe

	if debounceAnimation then
		isUsingAxe.Value = false
		debounceAnimation = false
		walkTrees(function(tree, index)
			local logSpawn = tree.LogSpawn
			local chopsNeeded = tree.Trunk:GetAttribute("numOfChops")
			if chopCount[index] == chopsNeeded and needWood then
				chopCount[index] = 0
				pitCount = camp.FirePit.PitBase:GetAttribute("logCount")
				if pitCount == 2 then
					needWood = false
				end
				local newLog = logPickup:Clone()
				newLog.CFrame = logSpawn.CFrame
				newLog.Parent = Workspace
				newLog.Touched:Connect(function(hit)
					local isHumanoid = hit.Parent:FindFirstChild("Humanoid")
					if isHumanoid and debouncePickup then
						debouncePickup = false
						local hasLog = Variables.hasLog
						local totalLogs = Variables.totLogs
						if not hasLog.Value then
							hasLog.Value = true
							totalLogs.Value += 1
							newLog:Destroy()
						end
						task.wait(2)
						debouncePickup = true
					end
				end)
			end
		end)
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

tool.Equipped:Connect(onEquip)
tool.Unequipped:Connect(onUnequip)
tool.Activated:Connect(onActivate)
tool.Deactivated:Connect(onDeactivate)
