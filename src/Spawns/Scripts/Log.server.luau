local ss = game:GetService("ServerStorage")
local players: Players = game:GetService("Players")
local log = ss:WaitForChild("Spawns").Log :: Part
local camp = workspace:WaitForChild("PlayArea").Camp:WaitForChild('Base') :: Model
local numOfLogs = #camp.FirePit.Wood:GetChildren()
local campBase = camp.campBase :: Part
local xPos = campBase.Position.X
local yPos = log.Size.Y / 2 
local zPos = campBase.Position.Z

local function ranLogPos()
  local randX = math.random(-15, 15) * -1
  local randZ = math.random(-15, 15) * -1
  local logPos = Vector3.new(xPos + randX, yPos, zPos + randZ)
  return logPos
end

for i=1, numOfLogs do
  local db = true
  local newLog = log:Clone()
  newLog.Position = ranLogPos()
  newLog.Parent = camp.LogSpawns
  newLog.Touched:Connect(function(hit)
    local char = hit.Parent
    local hum = char:FindFirstChild("Humanoid")
    if hum and db then
      db = false
      local plr = players:FindFirstChild(char.Name) 
      local pVars = plr:WaitForChild("plrVars")
      local pHasLog = pVars.hasLog
      if not pHasLog.Value then
        pHasLog.Value = true
        newLog:Destroy()
      else
        warn(`You already have a log {plr.Name}`)
      end
      task.wait(2)
      db = true
    end
  end)
end
