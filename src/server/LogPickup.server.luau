-- Programmatically set the parent to the script
-- in this case "Camp -> Log" is going to be the
-- parent of the current script. This is the re-
-- commended way since Rojo v7.x.x
local camp = workspace:WaitForChild("Camp")
local log = camp:WaitForChild("Log")
local logScript = script
logScript.Parent = log
