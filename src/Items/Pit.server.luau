local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Persona = require(Toolkits:WaitForChild("Persona"))

local camp = workspace:WaitForChild("PlayArea").Camp
local pit = camp:WaitForChild("FirePit"):WaitForChild("PitBase")
local fire = camp:WaitForChild("FirePit"):WaitForChild("Fire").Fire
local sign = camp.Signs:WaitForChild("Feedback").Back:WaitForChild("SignGui")
local message = sign.TextLabel

local pitScript = script
pitScript.Parent = pit

local debounce = true

local function checkPitNeeds(pitLogCount, logModel, hasFlint, hasStone)
	local missingItems = {}

	if pitLogCount < #logModel then
		table.insert(missingItems, "wood")
	end
	if not hasFlint then
		table.insert(missingItems, "flint")
	end
	if not hasStone then
		table.insert(missingItems, "stone")
	end

	local needs = table.concat(missingItems, " and ")
	local msg = #missingItems == 0 and "You lit the fire" or `We need {needs}`

	message.Text = msg
	sign.Enabled = true

	if pitLogCount >= #logModel and hasFlint and hasStone then
		fire.Enabled = true
		task.wait(5)
		for _, player in pairs(Persona.GetPlayers()) do
			--[=[
        Display an overlay element giving the option to restart the game when
        finished collecting resources successfully.

        @prop GameFrame Frame
        @within GameGui
      ]=]
			local gameFrame = player.PlayerGui.GameGui.GameFrame
			gameFrame.Visible = true
		end
	end
end

pit.Touched:Connect(function(hit)
	local humanoid = hit.Parent:WaitForChild("Humanoid")

	if humanoid and debounce then
		debounce = false

		local pitLogCount = pit:GetAttribute("logCount")
		local pitHasFlint = pit:GetAttribute("flint")
		local pitHasStone = pit:GetAttribute("stone")
		local pitLogParts = pit.Parent.Wood:GetChildren()

		local Variables = Persona.GetPlayerVariableFromPlayer("Variables", Persona.GetPlayerFromCharacter(hit.Parent))

		if pitHasFlint then
			Variables.hasFlint.Value = false
		else
			if Variables.hasFlint.Value then
				Variables.hasFlint.Value = false
				pit:SetAttribute("flint", true)
			end
		end

		if pitHasStone then
			Variables.hasStone.Value = false
		else
			if Variables.hasStone.Value then
				Variables.hasStone.Value = false
				pit:SetAttribute("stone", true)
			end
		end

		if Variables.hasLog.Value and pitLogCount < #pitLogParts then
			Variables.hasLog.Value = false
			pitLogCount += 1
			pit:SetAttribute("logCount", pitLogCount)
			for i = 1, pitLogCount do
				pitLogParts[i].Transparency = 0
			end
		end

		pitHasFlint = pit:GetAttribute("flint")
		pitHasStone = pit:GetAttribute("stone")

		checkPitNeeds(pitLogCount, pitLogParts, pitHasFlint, pitHasStone)

		task.wait(2)
		debounce = true
	end
end)
