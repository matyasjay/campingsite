--[=[
  @class Lighting
]=]

local Lighting = game:GetService("Lighting")

--[=[
  @prop Ambient Color3
  @within Lighting
]=]
Lighting.Ambient = Color3.fromRGB(0, 0, 0)

--[=[
  @prop Brightness number
  @within Lighting
]=]
Lighting.Brightness = 8.75

--[=[
  @prop TimeOfDay string
  @within Lighting
]=]
Lighting.TimeOfDay = "22:00:00"

--[=[
  @prop GlobalShadows boolean
  @within Lighting
]=]
Lighting.GlobalShadows = true

--[=[
  @prop EnvironmentDiffuseScale number
  @within Lighting
]=]
Lighting.EnvironmentDiffuseScale = 0.9

--[=[
  @prop EnvironmentSpecularScale number
  @within Lighting
]=]
Lighting.EnvironmentSpecularScale = 0.5

--[=[
  @prop ShadowSoftness number
  @within Lighting
]=]
Lighting.ShadowSoftness = 1

--[=[
  @prop Outlines boolean
  @within Lighting
]=]
Lighting.Outlines = false
