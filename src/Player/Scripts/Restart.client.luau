local ws = game:GetService("Workspace")
local player = script:FindFirstAncestorOfClass("Player")
local gameGui = player:WaitForChild("PlayerGui"):WaitForChild("GameGui")
local frame = gameGui:WaitForChild("GameFrame")
local button = frame.TextButton :: TextButton
local camp = ws:WaitForChild("PlayArea").Camp
local woodModel = camp:WaitForChild("FirePit"):WaitForChild("Wood"):GetChildren()
local pitBase = camp:WaitForChild("FirePit"):WaitForChild("PitBase")
local plrFire = camp:WaitForChild("FirePit"):WaitForChild("Fire").Fire
local signGui = camp.Signs:WaitForChild("Feedback"):WaitForChild("Back"):WaitForChild("SignGui") :: Part

local function resetGame()
	local allVars = player:WaitForChild("plrVars"):GetChildren()

	plrFire.Enabled = false
	pitBase:SetAttribute("logCount", 0)
	pitBase:SetAttribute("stone", false)
	pitBase:SetAttribute("flint", false)
	signGui.Enabled = false

	for i = 1, #woodModel do
		woodModel[i].Transparency = 1
	end

	allVars.hasLog.Value = false
	allVars.hasStone.Value = false
	allVars.hasFlint.Value = false
end

button.MouseButton1Click:Connect(function()
	frame.Visible = false
	resetGame()
end)
