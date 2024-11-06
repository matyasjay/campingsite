--[=[
  Collection of iterator utilities to use in the game.

  @class Iterator
  @tag Toolkit
]=]
local Iterator = {}

--[=[
  Execute the callback function on each element of a [Model] table.

  @param models {Model} -- The table of [Model]s to call the callback on
  @param callback (model: Model, index: number) -> () -- The callback function to call on each element in [Model]s
]=]
function Iterator.WalkModels(models: { Model }, callback: (model: Model, index: number) -> ())
	for index = 1, #models do
		local model = models[index]
		callback(model, index)
	end
end

return Iterator
