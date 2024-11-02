--[=[
  The Trigger class provides event handler abstractions that could be used
  in the game to run a given functionality when a specific event occurs.

  @class Trigger
  @tag Toolkit
]=]
local Trigger = {}

--[=[
  Executes the provided callback function when the trigger part was touched.
  This method sets its Parent element as the Part provided in the first argument. 

  @param trigger Part -- The Part that needs to be touched in order to run the callback
  @param callback (player: Player) -> () -- The functionality to run when the trigger happens
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
