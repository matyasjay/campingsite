local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Remote = require(ReplicatedStorage:WaitForChild("Remote"))

Players.PlayerAdded:Connect(Remote.Initialize)
