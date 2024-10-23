local plrs: Players = game:GetService("Players")
local camp = workspace:WaitForChild("Camp")
local pit = camp:WaitForChild("FirePit"):WaitForChild("PitBase") :: Part
local pitScript = script
pitScript.Parent = pit


local db = true

pit.Touched:Connect(function(hit)
  local char = hit.Parent
  local hum = char:FindFirstChild("Humanoid")

  if hum and db then
    db = false
    
    local plr = plrs:FindFirstChild(char.Name)
    local pVars = plr:WaitForChild("plrVars")
    local pHasLog = pVars.hasLog
    local logCount = pit:GetAttribute("logCount")
    local woods = pit.Parent.Wood :: Part
    local logs = woods:GetChildren()

    if pHasLog.Value and logCount < #logs then
      pHasLog.Value = false
      logCount += 1
      pit:SetAttribute("logCount", logCount)
      for i=1, logCount do
        logs[i].Transparency = 0
      end
    elseif not pHasLog.Value and logCount < #logs then
      warn(`Go find some wood {plr.Name}`)
    elseif pHasLog.Value and logCount == #logs then
      pHasLog.Value = false
      warn(`Go find some stone and flint {plr.Name}`)
    elseif not pHasLog.Value and logCount == #logs then
      warn(`Go find some stone and flint {plr.Name}`)
    end

    task.wait(2)
    db = true
  end
end)

