local Toolkits = game:GetService("ReplicatedStorage").Toolkits
local Persona = require(Toolkits:WaitForChild("Persona"))

--[=[
  The Trigger class provides event handler abstractions that could be used
  in the game to run a given functionality when a specific event occurs.

  @class Trigger
  @tag Toolkit
]=]
local Trigger = {}

--[=[
  Executes the provided callback function when the trigger [Part] was touched by a [Player].
  This method sets the [Script.Parent] to the [Part] provided in the first argument. 

  @param trigger Part -- The [Part] that needs to be touched in order to run the callback
  @param callback (player: Player) -> () -- The functionality to run when the trigger happens
]=]
function Trigger.RunOnTouched(trigger: Part, callback: (player: Player) -> ())
	script.Parent = trigger
	trigger.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") then
			callback(Persona.GetPlayerFromCharacter(hit.Parent))
		end
	end)
end

return Trigger
