--[=[
  @class Trigger
  @tag Toolkit
]=]
local Trigger = {}

--[=[
  Calls the provided callback function when the trigger part is touched.

  @param trigger Part
  @param callback (player: Player) -> ()
]=]
function Trigger.RunOnTouched(trigger: Part, callback: (player: Player) -> ())
	script.Parent = trigger
	trigger.Touched:Connect(function(hit)
		local char = hit.Parent
		local hum = char:FindFirstChild("Humanoid")
		if hum then
			callback(game.Players:GetPlayerFromCharacter(char))
		end
	end)
end

return Trigger
