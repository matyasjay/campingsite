--[=[
  @class Introduction

  This is the current version of the technical documentation for the 
  [Campingsite](https://github.com/matyasjay/campingsite) developer sandbox project.

  :::note
  The website is the output of an automated `Lua` documentation generator process.
  The class, prop and function signatures defined are based on inline code block
  comments. See [Moonwave](https://eryn.io/moonwave) for more details.
  :::
]=]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Remote = require(ReplicatedStorage:WaitForChild("RemoteConfig"))

Players.PlayerAdded:Connect(Remote.Initialize)
