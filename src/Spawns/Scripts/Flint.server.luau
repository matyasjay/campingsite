local ss = game:GetService("ServerStorage")
local players: Players = game:GetService("Players")
local flint = ss:WaitForChild("Spawns").Flint :: Part
local camp = workspace:WaitForChild("PlayArea").Camp:WaitForChild("Base") :: Model
local campBase = camp.campBase :: Part
local xPos = campBase.Position.X
local yPos = flint.Size.Y / 2 + campBase.Size.Y
local zPos = campBase.Position.Z

local function ranLogPos()
  local randX = math.random(-15, 15) * -1
  local randZ = math.random(-15, 15) * -1
  local logPos = Vector3.new(xPos + randX, yPos, zPos + randZ)
  return logPos
end

local db = true
local newFlint = flint:Clone()
newFlint.Position = ranLogPos()
newFlint.Parent = camp.FlintSpawns
newFlint.Touched:Connect(function(hit)
  local char = hit.Parent
  local hum = char:FindFirstChild("Humanoid")
  if hum and db then
    db = false
    local plr = players:FindFirstChild(char.Name) 
    local pVars = plr:WaitForChild("plrVars")
    local pHasFlint = pVars.hasFlint
    if not pHasFlint.Value then
      pHasFlint.Value = true
      newFlint:Destroy()
    else
      warn(`You already have a flint {plr.Name}`)
    end
    task.wait(2)
    db = true
  end
end)
