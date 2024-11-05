local pickTool = script.Parent
local player = pickTool.Parent.Parent

local Workspace = game:GetService("Workspace")
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Persona = require(ReplicatedStorage.Toolkits:WaitForChild("Persona"))
local Iterator = require(ReplicatedStorage.Toolkits:WaitForChild("Iterator"))
local Attributes = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))
local Statistics = require(ReplicatedStorage.Variables:WaitForChild("Statistics"))

local camp = Workspace:WaitForChild("PlayArea").Camp
local rocks = camp.Rocks:GetChildren()
local character = Persona.GetCharacterFromPlayer(player)

local pickCount = {}
local debouncePickup = true
local debounceAnimation = true

local function pickRockWhenPossible(rock, index)
	local target = (character.HumanoidRootPart.Position - rock.Position).Magnitude
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
	if pickCount[index] == stonePicks and not Attributes.Get("hasStone").Value then
		local newStone = stonePickup:Clone()
		newStone.Position = rock.Position + Vector3.new(5, 0, -5)
		newStone.Parent = Workspace
		newStone.Touched:Connect(function(hit)
			local humanoid = character:FindFirstChild("Humanoid")
			if humanoid and debouncePickup then
				debouncePickup = false
				if not Attributes.Get("hasStone").Value then
					Attributes.Get("hasStone").Value = true
					Statistics.Put("totalStones", Statistics.Get("totalStones").Value + 1)
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
	if pickCount[index] == flintPicks and not Attributes.Get("hasFlint").Value then
		local newFlint = flintPickup:Clone()
		newFlint.Position = rock.Position + Vector3.new(-5, 0, 5)
		newFlint.Parent = Workspace
		newFlint.Touched:Connect(function(hit)
			local humanoid = character:FindFirstChild("Humanoid")
			if humanoid and debouncePickup then
				debouncePickup = false
				if not Attributes.Get("hasFlint").Value then
					Attributes.Get("hasFlint").Value = true
					Statistics.Put("totalFlints", Statistics.Get("totalFlints").Value + 1)
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
		Statistics.Put("totalPickSwings", Statistics.Get("totalPickSwings").Value + 1)
		Iterator.WalkModels(rocks, pickRockWhenPossible)
		Attributes.Put("usingPick", true)
	end
end

local function onDeactivate()
	if debounceAnimation then
		debounceAnimation = false
		Attributes.Put("usingPick", false)
		Iterator.WalkModels(rocks, pickupSpawns)
		task.wait(1)
		debounceAnimation = true
	end
	debouncePickup = true
end

local function onEquip()
	Attributes.Put("hasPick", true)
end

local function onUnequip()
	Attributes.Put("hasPick", false)
end

pickTool.Equipped:Connect(onEquip)
pickTool.Unequipped:Connect(onUnequip)
pickTool.Activated:Connect(onActivate)
pickTool.Deactivated:Connect(onDeactivate)
