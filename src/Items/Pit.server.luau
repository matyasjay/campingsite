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

local PitAttributes = {
	["Logs"] = "logs",
	["Stone"] = "stone",
	["Flint"] = "flint",
}

local SEC_DEBOUNCE = 2
local SEC_BEFORE_RESTART = 5
local SUCCESS_MESSAGE = "You lit the fire! Let it blaze.."
local REQUIRED_MESSAGE = "We need "

local PlayArea = game:GetService("Workspace"):WaitForChild("PlayArea")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Observer = require(ReplicatedStorage.Toolkits:WaitForChild("Observer"))
local Trigger = require(ReplicatedStorage.Toolkits:WaitForChild("Trigger"))
local AttributesConfig = require(ReplicatedStorage:WaitForChild("AttributesConfig"))
local Attributes = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))
local GameGui = require(ReplicatedStorage.Guis:WaitForChild("GameGui"))

local camp = PlayArea.Camp
local pit = camp:WaitForChild("FirePit"):WaitForChild("PitBase")
local fire = camp:WaitForChild("FirePit"):WaitForChild("Fire").Fire

local pitScript = script
pitScript.Parent = pit

local debounce = true

local function checkPitNeeds(hit)
	local requirements = {
		[PitAttributes.Logs] = {
			current = pit:GetAttribute(PitAttributes.Logs),
			required = #pit.Parent.Woods:GetChildren(),
		},
		[PitAttributes.Stone] = {
			current = pit:GetAttribute(PitAttributes.Stone) and 1 or 0,
			required = 1,
		},
		[PitAttributes.Flint] = {
			current = pit:GetAttribute(PitAttributes.Flint) and 1 or 0,
			required = 1,
		},
	}
	if debounce then
		debounce = false
		if pit:GetAttribute(PitAttributes.Stone) or not Attributes.Get(AttributesConfig.Keys.HasStone) then
			Attributes.Put(AttributesConfig.Keys.HasStone, false)
		elseif Attributes.Get(AttributesConfig.Keys.HasStone).Value then
			Attributes.Put(AttributesConfig.Keys.HasStone, false)
			pit:SetAttribute(PitAttributes.Stone, true)
		end
		if pit:GetAttribute(PitAttributes.Flint) or not Attributes.Get(AttributesConfig.Keys.HasFlint) then
			Attributes.Put(AttributesConfig.Keys.HasFlint, false)
		elseif Attributes.Get(AttributesConfig.Keys.HasFlint).Value then
			Attributes.Put(AttributesConfig.Keys.HasFlint, false)
			pit:SetAttribute(PitAttributes.Flint, true)
		end
		if
			pit:GetAttribute(PitAttributes.Logs) == requirements.logs.required
			or not Attributes.Get(AttributesConfig.Keys.HasLog)
		then
			Attributes.Put(AttributesConfig.Keys.HasLog, false)
		elseif
			Attributes.Get(AttributesConfig.Keys.HasLog)
			and Attributes.Get(AttributesConfig.Keys.HasLog).Value
			and requirements.logs.current < requirements.logs.required
		then
			local logs = requirements.logs.current + 1
			Attributes.Put(AttributesConfig.Keys.HasLog, false)
			pit:SetAttribute(PitAttributes.Logs, logs)
			for i = 1, logs do
				pit.Parent.Woods:GetChildren()[i].Transparency = 0
			end
		end
	end
	Observer.TryEnableObject({
		requirements,
		object = fire,
		delay = SEC_BEFORE_RESTART,
		message = { done = SUCCESS_MESSAGE, required = REQUIRED_MESSAGE },
		callback = GameGui.showGameFrame,
		initialize = GameGui.showPitNeeds,
	})
	task.wait(SEC_DEBOUNCE)
	debounce = true
end

Trigger.RunOnTouched(pit, checkPitNeeds)
