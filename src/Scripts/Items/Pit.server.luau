local Pit = {}

local SUCCESS_MESSAGE = "You lit the fire! Let it blaze.."
local REQUIRED_MESSAGE = "We need "
local PIT_FEEDBACK = { done = SUCCESS_MESSAGE, required = REQUIRED_MESSAGE }

local Camp = game:GetService("Workspace").Camp
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Observer = require(ReplicatedStorage.Toolkits:WaitForChild("Observer"))
local Trigger = require(ReplicatedStorage.Toolkits:WaitForChild("Trigger"))
local Attributes = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))
local AttributesConfig = require(ReplicatedStorage:WaitForChild("Attributes"))
local GameGui = require(ReplicatedStorage.UserInterface:WaitForChild("GameGui"))

Pit.Attributes = {
	["Logs"] = "logs",
	["Stone"] = "stone",
	["Flint"] = "flint",
}

Pit.Requirements = {}
Pit.Base = Camp:WaitForChild("FirePit"):WaitForChild("PitBase")
Pit.Fire = Camp:WaitForChild("FirePit"):WaitForChild("Fire").Fire
Pit.Script = script
Pit.Script.Parent = Pit.Base
Pit.Debounce = true

function Pit.GetRequirements()
	return {
		[Pit.Attributes.Logs] = {
			current = Pit.Base:GetAttribute(Pit.Attributes.Logs),
			required = #Pit.Base.Parent.Woods:GetChildren(),
		},
		[Pit.Attributes.Stone] = {
			current = Pit.Base:GetAttribute(Pit.Attributes.Stone) and 1 or 0,
			required = 1,
		},
		[Pit.Attributes.Flint] = {
			current = Pit.Base:GetAttribute(Pit.Attributes.Flint) and 1 or 0,
			required = 1,
		},
	}
end

function Pit.CheckRequirements(hit)
	Pit.Requirements = Pit.GetRequirements()
	if Pit.Debounce then
		Pit.Debounce = false
		if Pit.Base:GetAttribute(Pit.Attributes.Stone) or not Attributes.Get(AttributesConfig.Keys.HasStone) then
			Attributes.Put(AttributesConfig.Keys.HasStone, false)
		elseif Attributes.Get(AttributesConfig.Keys.HasStone).Value then
			Attributes.Put(AttributesConfig.Keys.HasStone, false)
			Pit.Base:SetAttribute(Pit.Attributes.Stone, true)
		end
		if Pit.Base:GetAttribute(Pit.Attributes.Flint) or not Attributes.Get(AttributesConfig.Keys.HasFlint) then
			Attributes.Put(AttributesConfig.Keys.HasFlint, false)
		elseif Attributes.Get(AttributesConfig.Keys.HasFlint).Value then
			Attributes.Put(AttributesConfig.Keys.HasFlint, false)
			Pit.Base:SetAttribute(Pit.Attributes.Flint, true)
		end
		if
			Pit.Base:GetAttribute(Pit.Attributes.Logs) == Pit.Requirements[Pit.Attributes.Logs].required
			or not Attributes.Get(AttributesConfig.Keys.HasLog)
		then
			Attributes.Put(AttributesConfig.Keys.HasLog, false)
		elseif
			Attributes.Get(AttributesConfig.Keys.HasLog)
			and Attributes.Get(AttributesConfig.Keys.HasLog).Value
			and Pit.Requirements[Pit.Attributes.Logs].current < Pit.Requirements[Pit.Attributes.Logs].required
		then
			Pit.Requirements[Pit.Attributes.Logs].current += 1
			Attributes.Put(AttributesConfig.Keys.HasLog, false)
			Pit.Base:SetAttribute(Pit.Attributes.Logs, Pit.Requirements[Pit.Attributes.Logs].current)
			for i = 1, Pit.Requirements[Pit.Attributes.Logs].current do
				Pit.Base.Parent.Woods:GetChildren()[i].Transparency = 0
			end
		end
	end
	Observer.TryEnableObject({
		callback = GameGui.showGameFrame,
		initialize = GameGui.showPitNeeds,
		message = PIT_FEEDBACK,
		object = Pit.Fire,
		requirements = Pit.Requirements,
	})
	task.wait(2)
	Pit.Debounce = true
end

Trigger.RunOnTouched(Pit.Base, Pit.CheckRequirements)
