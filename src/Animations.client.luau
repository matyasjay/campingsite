local repStore = game:GetService("ReplicatedStorage")
local animMod = require(repStore.Toolkits:WaitForChild("Animation"))
local players = game:GetService("Players")
local player = players.LocalPlayer
local character = player.Character or player.Character:Wait()
local humanoid = character:WaitForChild("Humanoid")
local axeSwing = repStore.Shared.Animations:WaitForChild("AxeSwing") :: Animation
local axeAnimId = axeSwing.AnimationId
local pickSwing = repStore.Shared.Animations:WaitForChild("PickSwing") :: Animation
local pickAnimId = pickSwing.AnimationId
local pUsingAxe = player.plrVars.usingAxe
local pUsingPick = player.plrVars.usingPick
local _canRun = true

pUsingAxe.Changed:Connect(function()
	if pUsingAxe.Value == true then
		_canRun = false
		local success = animMod.LoadAnimation(humanoid, axeAnimId)
		if success then
			_canRun = true
		end
	end
end)

pUsingPick.Changed:Connect(function()
	if pUsingPick.Value == true then
		_canRun = false
		local success = animMod.LoadAnimation(humanoid, pickAnimId)
		if success then
			_canRun = true
		end
	end
end)
