"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[292],{20077:e=>{e.exports=JSON.parse('{"functions":[],"properties":[],"types":[],"name":"Animations","desc":"Configure animations and trigger event based on [Player] variable changes.\\n\\n:::info\\nExport created animations as an `.rbxm` files into the [ReplicatedStorage] to make\\nit available for other scripts for reference. You can create animations by placing\\nthe [Animator Platform](/api/Animations#Animator-Platform) into the [Workspace] and use the rigs on the platform to\\ndevelop the animation.\\n:::\\n\\n## Exported Animations\\n\\nThe currently available game animations in `.rbxm` format. Their filenameshould be the\\nsame as the configured ID.\\n\\n### Usage\\n\\n```lua\\nlocal ReplicatedStorage = game:GetService(\\"ReplicatedStorage\\")\\nlocal Animate = require(ReplicatedStorage.Toolkits:WaitForChild(\\"Animate\\"))\\nlocal Attributes = require(ReplicatedStorage.Variables:WaitForChild(\\"Attributes\\"))\\nlocal AttributesConfig = require(ReplicatedStorage:WaitForChild(\\"AttributesConfig\\"))\\n\\nlocal event = Attributes.Get(AttributesConfig.Keys.MyAttribute)\\nlocal animation = \\"MyAnimationId\\"\\n\\nAnimate.LoadAnimationOnChange(event, animation)\\n```\\n\\n## Animator Platform\\n\\nThe Animator Platform is a floating [Workspace] element outside of the _PlayArea_ that could be used to\\nconfigure animations.\\n\\nThe platform must contain at least one [Rig](https://create.roblox.com/docs/studio/rig-builder) to begin\\ncreating a new [Animation].\\n\\n![Animation Platform](https://p267.p3.n0.cdn.zight.com/items/RBuRp986/94612b4a-7270-4703-b311-91df1132dc26.jpg)","tags":["Main Script"],"source":{"line":43,"path":"src/Animations.client.luau"}}')}}]);