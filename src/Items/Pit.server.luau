local plrs: Players = game:GetService("Players")
local camp = workspace:WaitForChild("PlayArea").Camp :: Model
local pit = camp:WaitForChild("FirePit"):WaitForChild("PitBase") :: Part
local fire = camp:WaitForChild("FirePit"):WaitForChild("Fire").Fire :: Fire
local signGui = camp.Signs:WaitForChild("Feedback").Back:WaitForChild("SignGui") :: Part
local pMsg = signGui.TextLabel

local pitScript = script
pitScript.Parent = pit

local db = true

local function pitNeeds(logCount, logModel, hasFlint, hasStone)
	local missingItems = {}
	if logCount < #logModel then
		table.insert(missingItems, "wood")
	end
	if not hasFlint then
		table.insert(missingItems, "flint")
	end
	if not hasStone then
		table.insert(missingItems, "stone")
	end

	local needs = table.concat(missingItems, " and ")
	local msg = #missingItems == 0 and "You lit the fire" or "We need " .. needs

	pMsg.Text = msg
	signGui.Enabled = true

	if logCount >= #logModel and hasFlint and hasStone then
		fire.Enabled = true
		task.wait(5)
		local allPlrs = plrs:GetChildren()
		for _, eachPlayer in pairs(allPlrs) do
			eachPlayer.PlayerGui.GameGui.GameFrame.Visible = true
		end
	end
end

pit.Touched:Connect(function(hit)
	local char = hit.Parent
	local hum = char:FindFirstChild("Humanoid")

	if hum and db then
		db = false

		local plr = plrs:FindFirstChild(char.Name)
		local pVars = plr:WaitForChild("plrVars")
		local pHasLog = pVars.hasLog
		local pHasFlint = pVars.hasFlint
		local pHasStone = pVars.hasStone
		local logCount = pit:GetAttribute("logCount")
		local pitFlint = pit:GetAttribute("flint")
		local pitStone = pit:GetAttribute("stone")
		local woods = pit.Parent.Wood :: Part
		local logs = woods:GetChildren()

		if pitFlint then
			pHasFlint.Value = false
		else
			if pHasFlint.Value then
				pHasFlint.Value = false
				pit:SetAttribute("flint", true)
			end
		end

		if pitStone then
			pHasStone.Value = false
		else
			if pHasStone.Value then
				pHasStone.Value = false
				pit:SetAttribute("stone", true)
			end
		end

		if pHasLog.Value and logCount < #logs then
			pHasLog.Value = false
			logCount += 1
			pit:SetAttribute("logCount", logCount)
			for i = 1, logCount do
				logs[i].Transparency = 0
			end
		end

		pitFlint = pit:GetAttribute("flint")
		pitStone = pit:GetAttribute("stone")
		pitNeeds(logCount, logs, pitFlint, pitStone)
		task.wait(2)
		db = true
	end
end)
