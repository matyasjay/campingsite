local plrs: Players = game:GetService("Players")
local camp = workspace:WaitForChild("PlayArea").Camp :: Model
local pit = camp:WaitForChild("FirePit"):WaitForChild("PitBase") :: Part
local fire = camp:WaitForChild("FirePit"):WaitForChild("Fire").Fire :: Fire
local pitScript = script
pitScript.Parent = pit

local db = true

local function pitNeeds(logCount, logModel, hasFlint, hasStone)
  local missingItems = {
    logCount < #logModel and "wood" or nil,
    not hasFlint and "flint" or nil,
    not hasStone and "stone" or nil
  }

  local needs = table.concat(missingItems, " and ", 1, #missingItems)
  local msg = #missingItems == 0 and "You lit the fire" or "We need " .. needs
  
  if #missingItems == 0 then
    fire.Enabled = true
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

    if pitFlint then
      pHasFlint.Value = false
    else
      if pHasFlint.Value then
        pHasFlint.Value = false
        pit:SetAttribute("flint", true)
      end
    end

    if pitStone then
      pHasStone.Value = false
    else
      if pHasStone.Value then
        pHasStone.Value = false
        pit:SetAttribute("stone", true)
      end
    end

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

