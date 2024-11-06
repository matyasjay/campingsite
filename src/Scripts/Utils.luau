--[=[
  @class Utils
  @tag Main Script
  @tag Toolkit
]=]

local Utils = {}

--- @type StoreParams { [string]: boolean | number }
--- @within Utils
type StoreParams = { [string]: boolean | number }

--[=[
  @param store StoreParams
  @return StoreParams
  @within Utils
]=]
function Utils.GetKeysFromStore(store: StoreParams)
	local values = {}
	for key, _ in store do
		values[key] = key
	end
	return values
end

--[=[
  @param store StoreParams
  @return StoreParams
  @within Utils
]=]
function Utils.GetDefaultsFromStore(store: StoreParams)
	local defaults = {}
	for key, value in store do
		local normalizeValue = Instance.new(typeof(value) ~= "number" and "BoolValue" or "NumberValue")
		normalizeValue.Name = key
		normalizeValue.Value = value
		defaults[key] = normalizeValue
	end
	return defaults
end

Utils.LigthingDebounce = true
function Utils.Lighting(to: "night" | "day", duration, callback)
	local Lighting = game:GetService("Lighting")
	for i = 1, duration, 0.5 do
		local baseHour = (to == "night" and 16 or 04) + i
		local intHour = math.floor(baseHour)
		local hour = string.format("%02d", intHour)
		local minute = string.format("%02d", duration + baseHour - intHour)
		Lighting.TimeOfDay = `{hour}:{minute}:00`
		Lighting.Brightness = to == "night" and Lighting.Brightness - 1 or Lighting.Brightness + 1
		print(i, duration)
		if i - 0.5 == duration and typeof(callback) == "function" then
			callback()
		end
	end
end

return Utils
