-- Axe Tool

local tool = script.Parent
local ws = game:GetService("Workspace")
local ss = game:GetService("ServerStorage")
local plrs = game:GetService("Players")
local logPickup = ss:WaitForChild("Spawns").Log
local camp = ws:WaitForChild("PlayArea").Camp
local trees = camp.Trees:GetChildren()
local pitCount = camp.FirePit.PitBase:GetAttribute("logCount")
local chopCount = {}
local needWood = true
local db = true
local animDb = true

local function onActivate()
	if animDb then
		local char = tool.Parent
		local plr = plrs:FindFirstChild(char.Name)
		local pVars = plr:WaitForChild("plrVars")
		local pUsingAxe = pVars.usingAxe
		local pTotSwings = pVars.totAxeSwings
		pTotSwings.Value += 1

		for i = 1, #trees do
			local tree = trees[i]
			local chopsNeeded = tree.Trunk:GetAttribute("numOfChops")
			local target = (char.HumanoidRootPart.Position - tree.Trunk.Position).Magnitude

			if chopCount[i] == nil then
				chopCount[i] = 0
			end

			if target < 5 then
				if chopCount[i] == chopsNeeded then
					chopCount[i] = 0
				else
					chopCount[i] = chopCount[i] + 1
				end
			end
		end

		pUsingAxe.Value = true
	end
end

local function onDeactivate()
	local char = tool.Parent
	local plr = plrs:FindFirstChild(char.Name)
	local pVars = plr:WaitForChild("plrVars")
	local pUsingAxe = pVars.usingAxe

	if animDb then
		pUsingAxe.Value = false
		animDb = false
		for i = 1, #trees do
			local tree = trees[i]
			local chopsNeeded = tree.Trunk:GetAttribute("numOfChops")
			local logSpawn = tree.LogSpawn

			if chopCount[i] == chopsNeeded and needWood then
				chopCount[i] = 0
				pitCount = camp.FirePit.PitBase:GetAttribute("logCount")
				if pitCount == 2 then
					needWood = false
				end
				local newLog = logPickup:Clone()
				newLog.CFrame = logSpawn.CFrame
				newLog.Parent = ws
				newLog.Touched:Connect(function(hit)
					local char = hit.Parent
					local hum = char:FindFirstChild("Humanoid")
					if hum and db then
						db = false
						local pHasLog = pVars.hasLog
						local pTotLogs = pVars.totLogs
						if not pHasLog.Value then
							pHasLog.Value = true
							pTotLogs.Value += 1
							newLog:Destroy()
						else
							warn(`You already have a log {plr.Name}`)
						end
						task.wait(2)
						db = true
					end
				end)
			end
		end
		task.wait(1)
		animDb = true
	end
end

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
tool.Activated:Connect(onActivate)
tool.Deactivated:Connect(onDeactivate)
