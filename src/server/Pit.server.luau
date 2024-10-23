local plrs: Players = game:GetService("Players")
local camp = workspace:WaitForChild("Camp")
local pit = camp:WaitForChild("FirePit"):WaitForChild("PitBase") :: Part
local fire = camp:WaitForChild("FirePit"):WaitForChild("Fire").Fire :: Fire
local pitScript = script
pitScript.Parent = pit

local db = true

local function pitNeeds(logCount, logModel, hasFlint, hasStone)
  local msg = ""

  if logCount == #logModel and hasFlint and hasStone then
    fire.Enabled = true
    msg = "You lit the fire"
  elseif logCount == #logModel and hasFlint and not hasStone then
    msg = "We need stone"
  elseif logCount == #logModel and not hasFlint and hasStone then
    msg = "We need flint"
  elseif logCount == #logModel and not hasFlint and not hasStone then
    msg = "We need flint and stone"
  elseif logCount < #logModel and not hasFlint and not hasStone then
    msg = "We need wood, flint and stone"
  elseif logCount < #logModel and not hasFlint and hasStone then
    msg = "We need wood and flint"
  elseif logCount < #logModel and hasFlint and not hasStone then
    msg = "We need wood and stone"
  elseif logCount < #logModel and hasFlint and hasStone then
    msg = "We need wood"
  end
  return msg
end

pit.Touched:Connect(function(hit)
  local char = hit.Parent
  local hum = char:FindFirstChild("Humanoid")

  if hum and db then
    db = false
    
    local plr = plrs:FindFirstChild(char.Name)
    local pVars = plr:WaitForChild("plrVars")
    local pHasLog = pVars.hasLog
    local pHasFlint = pVars.hasFlint
    local pHasStone = pVars.hasStone
    local logCount = pit:GetAttribute("logCount")
    local pitFlint = pit:GetAttribute("flint")
    local pitStone = pit:GetAttribute("stone")
    local woods = pit.Parent.Wood :: Part
    local logs = woods:GetChildren()

    -- Flint Section
    if pitFlint then
      pHasFlint.Value = false
    else
      if pHasFlint.Value then
        pHasFlint.Value = false
        pit:SetAttribute("flint", true)
      end
    end

    -- Stone Section
    if pitStone then
      pHasStone.Value = false
    else
      if pHasStone.Value then
        pHasStone.Value = false
        pit:SetAttribute("stone", true)
      end
    end

    -- Logs Section
    if pHasLog.Value and logCount < #logs then
      pHasLog.Value = false
      logCount += 1
      pit:SetAttribute("logCount", logCount)
      for i=1, logCount do
        logs[i].Transparency = 0
      end
    end

    pitFlint = pit:GetAttribute("flint")
    pitStone = pit:GetAttribute("stone")
    warn(pitNeeds(logCount, logs, pitFlint, pitStone))

    task.wait(2)
    db = true
  end
end)

