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

return Utils
