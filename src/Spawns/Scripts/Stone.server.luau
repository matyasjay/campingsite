local ss = game:GetService("ServerStorage")
local players: Players = game:GetService("Players")
local stone = ss:WaitForChild("Spawns").Stone :: Part
local camp = workspace:WaitForChild("PlayArea").Camp:WaitForChild("Base") :: Model
local campBase = camp.campBase :: Part
local xPos = campBase.Position.X
local yPos = stone.Size.Y / 2 + campBase.Size.Y
local zPos = campBase.Position.Z

local function ranStonePos()
  local randX = math.random(-15, 15) * -1
  local randZ = math.random(-15, 15) * -1
  local logPos = Vector3.new(xPos + randX, yPos, zPos + randZ)
  return logPos
end

local db = true
local newStone = stone:Clone()
newStone.Position = ranStonePos()
newStone.Parent = camp.StoneSpawns
newStone.Touched:Connect(function(hit)
  local char = hit.Parent
  local hum = char:FindFirstChild("Humanoid")
  if hum and db then
    db = false
    local plr = players:FindFirstChild(char.Name) 
    local pVars = plr:WaitForChild("plrVars")
    local pHasStone = pVars.hasStone
    if not pHasStone.Value then
      pHasStone.Value = true
      newStone:Destroy()
    else
      warn(`You already have a stone {plr.Name}`)
    end
    task.wait(2)
    db = true
  end
end)
