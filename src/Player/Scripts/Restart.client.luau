local ws = game:GetService("Workspace")
local starterGui = game:GetService("StarterGui")
local player = script:FindFirstAncestorOfClass("Player")
local gameGui = player:WaitForChild("PlayerGui"):WaitForChild("GameGui")
local frame = gameGui:WaitForChild("GameFrame")
local button = frame.TextButton
local allVars = player:WaitForChild("plrVars"):GetChildren()
local camp = ws:WaitForChild("PlayArea").Camp
local woodModel = camp:WaitForChild("FirePit"):WaitForChild("Wood"):GetChildren()
local pitBase = camp:WaitForChild("FirePit"):WaitForChild("PitBase")
local plrFire = camp:WaitForChild("FirePit"):WaitForChild("Fire").Fire
local signGui = camp.Signs:WaitForChild("Feedback"):WaitForChild("Back"):WaitForChild("SignGui") :: Part

local function resetGame()
	plrFire.Enabled = false
	pitBase:SetAttribute("logCount", 0)
	pitBase:SetAttribute("stone", false)
	pitBase:SetAttribute("flint", false)
	signGui.Enabled = false

	for i = 1, #woodModel do
		woodModel[i].Transparency = 1
	end

	for eachVar, eachVal in pairs(allVars) do
		allVars[eachVar].Value = false
	end
end

button.MouseButton1Click:Connect(function()
	frame.Visible = false
	resetGame()
end)
