local repStore = game:GetService("ReplicatedStorage")
local animMod = require(repStore:WaitForChild("AnimationModule") :: Animation)
local players = game:GetService("Players")
local player = players.LocalPlayer

print(player)
