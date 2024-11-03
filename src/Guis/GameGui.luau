--[=[
  This class represents the GUI configuration for the in-game feedback elements for the current [Player].

  @class GameGui
  @tag User Interface
]=]
local GameGui = {}

--[=[
  Display an overlay element giving the option to restart the game when
  finished collecting resources successfully.

  @function showGameFrame 
  @within GameGui
]=]
function GameGui.showGameFrame(player: Player)
	local gameFrame = player.PlayerGui.GameGui.GameFrame
	gameFrame.Visible = true
end

return GameGui
