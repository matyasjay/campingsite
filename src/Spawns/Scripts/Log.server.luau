local ss = game:GetService("ServerStorage")
local players: Players = game:GetService("Players")
local log = ss:WaitForChild("Spawns").Log :: Part

local db = true

log.Touched:Connect(function(hit)
  local char = hit.Parent
  local hum = char:FindFirstChild("Humanoid")
  if hum and db then
    db = false
    local plr = players:FindFirstChild(char.Name) 
    local pVars = plr:WaitForChild("plrVars")
    local pHasLog = pVars.hasLog
    if not pHasLog.Value then
      pHasLog.Value = true
      log:Destroy()
    else
      warn(`You already have a log {plr.Name}`)
    end
    task.wait(2)
    db = true
  end
end)
