local pickTool = script.Parent
local player = pickTool.Parent.Parent

local Workspace = game:GetService("Workspace")
local ServerStorage = game:GetService("ServerStorage")
local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Persona = require(Toolkits:WaitForChild("Persona"))
local Iterator = require(Toolkits:WaitForChild("Iterator"))
local Character = Persona.GetCharacterFromPlayer(player)
local Statistics = Persona.GetPlayerVariableFromPlayer("Statistics", player)
local Variables = Persona.GetPlayerVariableFromPlayer("Variables", player)

local camp = Workspace:WaitForChild("PlayArea").Camp
local rocks = camp.Rocks:GetChildren()

local pickCount = {}
local debouncePickup = true
local debounceAnimation = true

local function pickRockWhenPossible(rock, index)
	local target = (Character.HumanoidRootPart.Position - rock.Position).Magnitude
	if pickCount[index] == nil then
		pickCount[index] = 0
	end
	if target <= 6 then
		if pickCount[index] == 8 then
			pickCount[index] = 0
		else
			if debouncePickup then
				debouncePickup = false
				pickCount[index] += 1
			end
		end
	end
end

local function pickupStone(rock, index)
	local stonePicks = rock:GetAttribute("stonePicks")
	local stonePickup = ServerStorage:WaitForChild("Spawns").Stone
	if pickCount[index] == stonePicks and not Variables.hasStone.Value then
		local newStone = stonePickup:Clone()
		newStone.Position = rock.Position + Vector3.new(5, 0, -5)
		newStone.Parent = Workspace
		newStone.Touched:Connect(function(hit)
			local humanoid = Character:FindFirstChild("Humanoid")
			if humanoid and debouncePickup then
				debouncePickup = false
				if not Variables.hasStone.Value then
					Variables.hasStone.Value = true
					Statistics.totalStones.Value += 1
					newStone:Destroy()
				end
				task.wait(2)
				debouncePickup = true
			end
		end)
	end
end

local function pickupFlint(rock, index)
	local flintPicks = rock:GetAttribute("flintPicks")
	local flintPickup = ServerStorage:WaitForChild("Spawns").Flint
	if pickCount[index] == flintPicks and not Variables.hasFlint.Value then
		local newFlint = flintPickup:Clone()
		newFlint.Position = rock.Position + Vector3.new(-5, 0, 5)
		newFlint.Parent = Workspace
		newFlint.Touched:Connect(function(hit)
			local humanoid = Character:FindFirstChild("Humanoid")
			if humanoid and debouncePickup then
				debouncePickup = false
				if not Variables.hasFlint.Value then
					Variables.hasFlint.Value = true
					Statistics.totalFlints.Value += 1
					newFlint:Destroy()
				end
				task.wait(2)
				debouncePickup = true
			end
		end)
	end
end

local function pickupSpawns(rock, index)
	pickupStone(rock, index)
	pickupFlint(rock, index)
end

local function onActivate()
	if debounceAnimation then
		Statistics.totalPickSwings.Value += 1
		Iterator.WalkModels(rocks, pickRockWhenPossible)
		Variables.usingPick.Value = true
	end
end

local function onDeactivate()
	if debounceAnimation then
		debounceAnimation = false
		Variables.usingPick.Value = false
		Iterator.WalkModels(rocks, pickupSpawns)
		task.wait(1)
		debounceAnimation = true
	end
	debouncePickup = true
end

local function onEquip()
	Variables.hasPick.Value = true
end

local function onUnequip()
	Variables.hasPick.Value = false
end

pickTool.Equipped:Connect(onEquip)
pickTool.Unequipped:Connect(onUnequip)
pickTool.Activated:Connect(onActivate)
pickTool.Deactivated:Connect(onDeactivate)
