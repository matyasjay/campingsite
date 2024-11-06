--- @type Requirements { [string]: { current: number, required: number  } }
--- @within Observer

--- @type Message { done: string, required: string }
--- @within Observer

--[=[
  Utilities to interact with in-game objects.

  @class Observer
  @tag Toolkit
]=]
local Observer = {}

--[=[
  @param requirements Requirements
  @param message Message
  @within Observer
]=]
function Observer.CheckRequirements(requirements, message)
	local required = {}
	for key, requirement in requirements do
		if requirement.current < requirement.required then
			table.insert(required, key)
		end
	end
	return {
		required = required,
		message = #required == 0 and `{message.done}` or `{message.required} {table.concat(required, " and ")}`,
	}
end

--- @interface Props
--- @field requirements Requirements
--- @field message Message
--- @field object Instance
--- @field delay? number
--- @field initialize? (message: string) -> ()
--- @field callback? () -> ()
--- @within Observer

--[=[
  @param props Props
  @within Observer
]=]
function Observer.TryEnableObject(props)
	local checkResult = Observer.CheckRequirements(props.requirements, props.message)
	local hasRequired = true
	for _, key in checkResult.required do
		local requirement = props.requirements[key]
		hasRequired = hasRequired and requirement.required == requirement.current
	end
	if props.initialize and typeof(props.initialize) == "function" then
		props.initialize(checkResult.message)
	end
	if hasRequired then
		props.object.Enabled = true
		if props.callback and typeof(props.callback) == "function" then
			props.callback()
		end
	end
	return checkResult.message
end

return Observer
