--[=[
  @class Animations
  @tag Main Script
  
  Configure animations and trigger event based on [Player] variable changes.
  
  :::info
  Export created animations as an `.rbxm` files into the [ReplicatedStorage] to make
  it available for other scripts for reference. You can create animations by placing
  the [Animator Platform](/api/Animations#Animator-Platform) into the [Workspace] and use the rigs on the platform to
  develop the animation.
  :::

  ## Exported Animations

  The currently available game animations in `.rbxm` format. Their filenameshould be the
  same as the configured ID.

  ### Usage

  ```lua
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local Animate = require(ReplicatedStorage.Toolkits:WaitForChild("Animate"))
  local Attributes = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))
  local AttributesConfig = require(ReplicatedStorage:WaitForChild("AttributesConfig"))

  local event = Attributes.Get(AttributesConfig.Keys.MyAttribute)
  local animation = "MyAnimationId"

  Animate.LoadAnimationOnChange(event, animation)
  ```

  ## Animator Platform

  The Animator Platform is a floating [Workspace] element outside of the _PlayArea_ that could be used to
  configure animations.

  The platform must contain at least one [Rig](https://create.roblox.com/docs/studio/rig-builder) to begin
  creating a new [Animation].

  ![Animation Platform](https://p267.p3.n0.cdn.zight.com/items/RBuRp986/94612b4a-7270-4703-b311-91df1132dc26.jpg)
]=]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animate = require(ReplicatedStorage.Toolkits:WaitForChild("Animate"))
local Attributes = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))
local AttributesConfig = require(ReplicatedStorage:WaitForChild("AttributesConfig"))

Animate.LoadAnimationOnChange(Attributes.Get(AttributesConfig.Keys.UsingAxe), Animate.GetAnimationId("AxeSwing"))
Animate.LoadAnimationOnChange(Attributes.Get(AttributesConfig.Keys.UsingPick), Animate.GetAnimationId("PickSwing"))
