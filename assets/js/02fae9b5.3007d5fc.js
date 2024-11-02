"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[331],{3905:(e,t,n)=>{n.d(t,{Zo:()=>c,kt:()=>h});var a=n(67294);function r(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function o(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,a)}return n}function i(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?o(Object(n),!0).forEach((function(t){r(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):o(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function l(e,t){if(null==e)return{};var n,a,r=function(e,t){if(null==e)return{};var n,a,r={},o=Object.keys(e);for(a=0;a<o.length;a++)n=o[a],t.indexOf(n)>=0||(r[n]=e[n]);return r}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(a=0;a<o.length;a++)n=o[a],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(r[n]=e[n])}return r}var s=a.createContext({}),p=function(e){var t=a.useContext(s),n=t;return e&&(n="function"==typeof e?e(t):i(i({},t),e)),n},c=function(e){var t=p(e.components);return a.createElement(s.Provider,{value:t},e.children)},u="mdxType",m={inlineCode:"code",wrapper:function(e){var t=e.children;return a.createElement(a.Fragment,{},t)}},d=a.forwardRef((function(e,t){var n=e.components,r=e.mdxType,o=e.originalType,s=e.parentName,c=l(e,["components","mdxType","originalType","parentName"]),u=p(n),d=r,h=u["".concat(s,".").concat(d)]||u[d]||m[d]||o;return n?a.createElement(h,i(i({ref:t},c),{},{components:n})):a.createElement(h,i({ref:t},c))}));function h(e,t){var n=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var o=n.length,i=new Array(o);i[0]=d;var l={};for(var s in t)hasOwnProperty.call(t,s)&&(l[s]=t[s]);l.originalType=e,l[u]="string"==typeof e?e:r,i[1]=l;for(var p=2;p<o;p++)i[p]=n[p];return a.createElement.apply(null,i)}return a.createElement.apply(null,n)}d.displayName="MDXCreateElement"},76647:(e,t,n)=>{n.r(t),n.d(t,{contentTitle:()=>i,default:()=>u,frontMatter:()=>o,metadata:()=>l,toc:()=>s});var a=n(87462),r=(n(67294),n(3905));const o={},i=void 0,l={type:"mdx",permalink:"/campingsite/",source:"@site/pages/index.md",description:"Camping in R(oblox)ojo Land!",frontMatter:{}},s=[{value:"Features",id:"features",level:2},{value:"Preview",id:"preview",level:2},{value:"Development",id:"development",level:2},{value:"Starting the Rojo Server",id:"starting-the-rojo-server",level:3},{value:"Building the Project",id:"building-the-project",level:3},{value:"Testing",id:"testing",level:3}],p={toc:s},c="wrapper";function u(e){let{components:t,...n}=e;return(0,r.kt)(c,(0,a.Z)({},p,n,{components:t,mdxType:"MDXLayout"}),(0,r.kt)("p",{align:"center"},(0,r.kt)("img",{src:"https://github.com/matyasjay/campingsite/blob/main/.moonwave/static/favicon.png?raw=true",width:"350px"})),(0,r.kt)("h1",{align:"center"},"Camping in R(oblox)ojo Land!"),(0,r.kt)("p",null,(0,r.kt)("img",{parentName:"p",src:"https://img.shields.io/github/v/release/matyasjay/campingsite",alt:"GitHub Release"}),"\n",(0,r.kt)("img",{parentName:"p",src:"https://img.shields.io/github/actions/workflow/status/matyasjay/campingsite/.github%2Fworkflows%2Fbuild.yml",alt:"GitHub Actions Workflow Status"}),"\n",(0,r.kt)("img",{parentName:"p",src:"https://img.shields.io/badge/Luau-Roblox-blue",alt:"Static Badge"}),"\n",(0,r.kt)("img",{parentName:"p",src:"https://img.shields.io/badge/Rojo-v7-orange",alt:"Static Badge"})),(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"Play this game online at ",(0,r.kt)("a",{parentName:"strong",href:"https://www.roblox.com/games/117153514135869/Camping"},"Roblox.com"),"!")),(0,r.kt)("p",null,"This repository is a fully managed setup for Roblox Studio using ",(0,r.kt)("a",{parentName:"p",href:"https://github.com/rojo-rbx/rojo"},"Rojo"),".\nIt includes all assets, scripts, models, and tools that make up the game environment."),(0,r.kt)("blockquote",null,(0,r.kt)("p",{parentName:"blockquote"},"[!NOTE]","\nThe ",(0,r.kt)("em",{parentName:"p"},"campingsite")," project is a personal learning sandbox and includes\nexperimental solutions not intended for serious gameplay. While it serves\nas a development playground, each iteration is published on Roblox Hub as\na public experience, so it remains accessible and playable in the Roblox Client.")),(0,r.kt)("h2",{id:"features"},"Features"),(0,r.kt)("p",null,"The game's objective is to light a fire in the fireplace. Players gather logs by chopping trees and collect stone and flint by mining rocks. Each player starts with the necessary tools in their inventory and receives guidance through wooden signs. All gathered resources must be placed on the firepit, and once complete, the fire lights automatically. After a short delay, players can choose to play again, which resets the game to its initial state."),(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},"Camp area with trees to chop, rocks to mine, and a central fireplace"),(0,r.kt)("li",{parentName:"ul"},"Axe and pickaxe provided for resource gathering"),(0,r.kt)("li",{parentName:"ul"},"Progress feedback through wooden signs"),(0,r.kt)("li",{parentName:"ul"},"Option to replay after lighting the fire"),(0,r.kt)("li",{parentName:"ul"},"Store and track player stats (visits, logs chopped, stone, flint picked and tools swinged) on the server")),(0,r.kt)("h2",{id:"preview"},"Preview"),(0,r.kt)("p",null,(0,r.kt)("a",{parentName:"p",href:"https://github.com/user-attachments/assets/8e6e6567-43ef-4fc7-a265-0e550b105c6b"},"https://github.com/user-attachments/assets/8e6e6567-43ef-4fc7-a265-0e550b105c6b")),(0,r.kt)("h2",{id:"development"},"Development"),(0,r.kt)("p",null,"Visit the ",(0,r.kt)("a",{parentName:"p",href:"https://matyasjay.github.io/campingsite"},"API documentation")," to see the available classes and functions to use when developing this project!"),(0,r.kt)("h3",{id:"starting-the-rojo-server"},"Starting the Rojo Server"),(0,r.kt)("p",null,"To launch the project in Roblox Studio, start the Rojo server by running:"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-sh"},"make serve\n")),(0,r.kt)("p",null,"This command merges the files in the ",(0,r.kt)("inlineCode",{parentName:"p"},"project")," folder and generates\nthe ",(0,r.kt)("inlineCode",{parentName:"p"},"default.project.json")," file in the root directory."),(0,r.kt)("p",null,"Once the Rojo server is running, connect to it using the Rojo Plugin in Roblox Studio."),(0,r.kt)("h3",{id:"building-the-project"},"Building the Project"),(0,r.kt)("p",null,"To manually build the project, execute:"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-sh"},"make build\n")),(0,r.kt)("p",null,"This command generates the ",(0,r.kt)("inlineCode",{parentName:"p"},"default.project.json")," file in the root directory.\nAdditionally, pushing to the ",(0,r.kt)("inlineCode",{parentName:"p"},"main")," branch triggers a GitHub Action that builds\nthe project and outputs the compiled game file as ",(0,r.kt)("inlineCode",{parentName:"p"},"build/latest.rbxm"),"."),(0,r.kt)("p",null,"The ",(0,r.kt)("inlineCode",{parentName:"p"},"build/latest.rbxm")," file is equivalent to the output from running ",(0,r.kt)("inlineCode",{parentName:"p"},"rojo build -o build/latest.rbxm"),"."),(0,r.kt)("blockquote",null,(0,r.kt)("p",{parentName:"blockquote"},"[!IMPORTANT]"),(0,r.kt)("h2",{parentName:"blockquote",id:"known-issues"},"Known Issues"),(0,r.kt)("ul",{parentName:"blockquote"},(0,r.kt)("li",{parentName:"ul"},"You need to manually restart Rojo Server to make project file changes applied"))),(0,r.kt)("h3",{id:"testing"},"Testing"),(0,r.kt)("p",null,"The project uses LuaUnit as its generic native Lua test framework."))}u.isMDXComponent=!0}}]);