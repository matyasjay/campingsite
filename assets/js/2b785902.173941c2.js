"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[1381],{3905:(e,t,n)=>{n.d(t,{Zo:()=>p,kt:()=>f});var r=n(67294);function o(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function a(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function i(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?a(Object(n),!0).forEach((function(t){o(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):a(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function l(e,t){if(null==e)return{};var n,r,o=function(e,t){if(null==e)return{};var n,r,o={},a=Object.keys(e);for(r=0;r<a.length;r++)n=a[r],t.indexOf(n)>=0||(o[n]=e[n]);return o}(e,t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(r=0;r<a.length;r++)n=a[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(o[n]=e[n])}return o}var c=r.createContext({}),s=function(e){var t=r.useContext(c),n=t;return e&&(n="function"==typeof e?e(t):i(i({},t),e)),n},p=function(e){var t=s(e.components);return r.createElement(c.Provider,{value:t},e.children)},u="mdxType",d={inlineCode:"code",wrapper:function(e){var t=e.children;return r.createElement(r.Fragment,{},t)}},m=r.forwardRef((function(e,t){var n=e.components,o=e.mdxType,a=e.originalType,c=e.parentName,p=l(e,["components","mdxType","originalType","parentName"]),u=s(n),m=o,f=u["".concat(c,".").concat(m)]||u[m]||d[m]||a;return n?r.createElement(f,i(i({ref:t},p),{},{components:n})):r.createElement(f,i({ref:t},p))}));function f(e,t){var n=arguments,o=t&&t.mdxType;if("string"==typeof e||o){var a=n.length,i=new Array(a);i[0]=m;var l={};for(var c in t)hasOwnProperty.call(t,c)&&(l[c]=t[c]);l.originalType=e,l[u]="string"==typeof e?e:o,i[1]=l;for(var s=2;s<a;s++)i[s]=n[s];return r.createElement.apply(null,i)}return r.createElement.apply(null,n)}m.displayName="MDXCreateElement"},73101:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>c,contentTitle:()=>i,default:()=>d,frontMatter:()=>a,metadata:()=>l,toc:()=>s});var r=n(87462),o=(n(67294),n(3905));const a={sidebar_position:3},i="Player Tools & Equipment",l={unversionedId:"tools",id:"tools",title:"Player Tools & Equipment",description:"Tools are items that can appear in a player's inventory and be equipped to perform",source:"@site/docs/tools.md",sourceDirName:".",slug:"/tools",permalink:"/campingsite/docs/tools",draft:!1,editUrl:"https://github.com/matyasjay/campingsite/edit/main/docs/tools.md",tags:[],version:"current",sidebarPosition:3,frontMatter:{sidebar_position:3},sidebar:"defaultSidebar",previous:{title:"The Workspace Structure",permalink:"/campingsite/docs/play_area"},next:{title:"Interactive Environment Items",permalink:"/campingsite/docs/items"}},c={},s=[{value:"Create",id:"create",level:2},{value:"Configuration",id:"configuration",level:3},{value:"Script",id:"script",level:3}],p={toc:s},u="wrapper";function d(e){let{components:t,...n}=e;return(0,o.kt)(u,(0,r.Z)({},p,n,{components:t,mdxType:"MDXLayout"}),(0,o.kt)("h1",{id:"player-tools--equipment"},"Player Tools & Equipment"),(0,o.kt)("p",null,'Tools are items that can appear in a player\'s inventory and be equipped to perform\nspecific tasks. For example, an "Axe" tool might be placed in the ',(0,o.kt)("a",{parentName:"p",href:"https://create.roblox.com/docs/reference/engine/classes/StarterPack"},"StarterPack")," so\nthat players receive it upon joining the game and can use it to chop down trees."),(0,o.kt)("p",null,"To make a tool available in-game, store it as a replicable instance in ",(0,o.kt)("a",{parentName:"p",href:"https://create.roblox.com/docs/reference/engine/classes/ReplicatedStorage"},"ReplicatedStorage"),"\nand clone it into the player's inventory when needed."),(0,o.kt)("p",null,"You can create animations for tools using the ",(0,o.kt)("a",{parentName:"p",href:"https://create.roblox.com/docs/animation/editor"},"Animation Editor"),"\nand a compatible ",(0,o.kt)("a",{parentName:"p",href:"https://create.roblox.com/docs/studio/rig-builder"},"Rig"),".\nOnce created, these animations can be configured to trigger in response to specific in-game events."),(0,o.kt)("h2",{id:"create"},"Create"),(0,o.kt)("h3",{id:"configuration"},"Configuration"),(0,o.kt)("p",null,"In ",(0,o.kt)("inlineCode",{parentName:"p"},"project/Tools.project.json")," add the following section:"),(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-json"},'{\n  "StarterPack": {\n    "$className": "StarterPack",\n    "$path": "src/Models/Player/StarterPack",\n    "MyTool": {\n      "$path": "src/Models/Tools/MyTool.rbxm",\n      "Script": {\n        "$path": "src/Scripts/Tools/MyTool.server.luau"\n      }\n    }\n  }\n}\n')),(0,o.kt)("h3",{id:"script"},"Script"),(0,o.kt)("p",null,"Create your Tool in ",(0,o.kt)("inlineCode",{parentName:"p"},"src/Scripts/Tools/MyTool.server.luau")," for example:"),(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-lua"},'local ReplicatedStorage = game:GetService("ReplicatedStorage")\nlocal AttributesConfig = require(ReplicatedStorage:WaitForChild("Attributes"))\nlocal AttributesVariable = require(ReplicatedStorage.Variables:WaitForChild("Attributes"))\n\nlocal myTool = script.Parent\n\nlocal function onEquip()\nAttributesVariable.Put(AttributesConfig.Keys.HasAxe, true)\nend\n\nlocal function onUnequip()\nAttributesVariable.Put(AttributesConfig.Keys.HasAxe, false)\nend\n\nmyTool.Equipped:Connect(onEquip)\nmyTool.Unequipped:Connect(onUnequip)\n\n-- myTool.Activated:Connect(onActivate)\n-- myTool.Deactivated:Connect(onDeactivate)\n')))}d.isMDXComponent=!0}}]);