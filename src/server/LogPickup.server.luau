-- Programmatically set the parent to the script
-- in this case "Camp -> Log" is going to be the
-- parent of the current script. This is the re-
-- commended way since Rojo v7.x.x
local camp = workspace:WaitForChild("Camp")
local log = camp:WaitForChild("Log") :: Part
local logScript = script
logScript.Parent = log

local db = true -- debounce

log.Touched:Connect(function(hit)
  local char = hit.Parent
  local hum = char:FindFirstChild("Humanoid")

  if hum and db then
    db = false
    local players: Players = game:GetService("Players")
    local plr = players:FindFirstChild(char.Name) 
    local pVars = plr:WaitForChild("plrVars")
    local pHasLog = pVars.hasLog

    if not pHasLog.Value then
      pHasLog.Value = true
      log.Transparency = 1
      log.CanCollide = false
      print("You picked up a log")
    end

    task.wait(2)
    db = true
    log.Transparency = 0
    log.CanCollide = true
  end
end)
