--[=[
  @class Fire Pit
  @tag Environment Item
  @tag Main Quest

  The final goal of the game is to fill the requirements of the Fire Pit.

  Collect the resource in the environment and place them in the Fire Pit to lit the fire!

  After a brief delay the game offers to restart in which case the Fire Pit resets to its
  original state and the lit fire put out.

  ![src](https://p267.p3.n0.cdn.zight.com/items/mXuQX6b8/d801d221-0334-4901-82a8-7ba047e4dce1.jpg)

  ## Usage
  ```lua
  local PlayArea = game:GetService("Workspace"):WaitForChild("PlayArea")
  print(PlayArea.Camp:WaitForChild("FirePit"))
  ```
]=]

local PlayArea = game:GetService("Workspace"):WaitForChild("PlayArea")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Observer = require(ReplicatedStorage.Toolkits:WaitForChild("Observer"))
local Trigger = require(ReplicatedStorage.Toolkits:WaitForChild("Trigger"))
local Attributes = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))
local GameGui = require(ReplicatedStorage.Guis:WaitForChild("GameGui"))

local SEC_DEBOUNCE = 2
local SEC_BEFORE_RESTART = 5
local SUCCESS_MESSAGE = "You lit the fire! Let it blaze.."
local REQUIRED_MESSAGE = "We need "

local camp = PlayArea.Camp
local pit = camp:WaitForChild("FirePit"):WaitForChild("PitBase")
local enableObject = camp:WaitForChild("FirePit"):WaitForChild("Fire").Fire
local sign = camp.Signs:WaitForChild("Feedback").Back:WaitForChild("SignGui")

local pitScript = script
pitScript.Parent = pit

local debounce = true

local function checkPitNeeds(hit)
	local requirements = {
		["logs"] = {
			current = pit:GetAttribute("logs"),
			required = #pit.Parent.Woods:GetChildren(),
		},
		["stone"] = {
			current = pit:GetAttribute("stone") and 1 or 0,
			required = 1,
		},
		["flint"] = {
			current = pit:GetAttribute("flint") and 1 or 0,
			required = 1,
		},
	}
	if debounce then
		debounce = false
		if pit:GetAttribute("stone") or not Attributes.Get("hasStone") then
			Attributes.Put("hasStone", false)
		elseif Attributes.Get("hasStone").Value then
			Attributes.Put("hasStone", false)
			pit:SetAttribute("stone", true)
		end
		if pit:GetAttribute("flint") or not Attributes.Get("hasFlint") then
			Attributes.Put("hasFlint", false)
		elseif Attributes.Get("hasFlint").Value then
			Attributes.Put("hasFlint", false)
			pit:SetAttribute("flint", true)
		end
		if pit:GetAttribute("logs") == requirements.logs.required or not Attributes.Get("hasLog") then
			Attributes.Put("hasLog", false)
		elseif
			Attributes.Get("hasLog")
			and Attributes.Get("hasLog").Value
			and requirements.logs.current < requirements.logs.required
		then
			local logs = requirements.logs.current + 1
			Attributes.Put("hasLog", false)
			pit:SetAttribute("logs", logs)
			for i = 1, logs do
				pit.Parent.Woods:GetChildren()[i].Transparency = 0
			end
		end
	end
	local checkResultMessage = Observer.TryEnableObject({
		requirements = requirements,
		object = enableObject,
		delay = SEC_BEFORE_RESTART,
		message = {
			done = SUCCESS_MESSAGE,
			required = REQUIRED_MESSAGE,
		},
		callback = GameGui.showGameFrame,
	})
	sign.TextLabel.Text = checkResultMessage
	sign.Enabled = true
	task.wait(SEC_DEBOUNCE)
	debounce = true
end

Trigger.RunOnTouched(pit, checkPitNeeds)
