"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[6320],{3905:(e,t,n)=>{n.d(t,{Zo:()=>u,kt:()=>f});var a=n(67294);function r(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function l(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,a)}return n}function o(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?l(Object(n),!0).forEach((function(t){r(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):l(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function s(e,t){if(null==e)return{};var n,a,r=function(e,t){if(null==e)return{};var n,a,r={},l=Object.keys(e);for(a=0;a<l.length;a++)n=l[a],t.indexOf(n)>=0||(r[n]=e[n]);return r}(e,t);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(a=0;a<l.length;a++)n=l[a],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(r[n]=e[n])}return r}var i=a.createContext({}),c=function(e){var t=a.useContext(i),n=t;return e&&(n="function"==typeof e?e(t):o(o({},t),e)),n},u=function(e){var t=c(e.components);return a.createElement(i.Provider,{value:t},e.children)},d="mdxType",p={inlineCode:"code",wrapper:function(e){var t=e.children;return a.createElement(a.Fragment,{},t)}},m=a.forwardRef((function(e,t){var n=e.components,r=e.mdxType,l=e.originalType,i=e.parentName,u=s(e,["components","mdxType","originalType","parentName"]),d=c(n),m=r,f=d["".concat(i,".").concat(m)]||d[m]||p[m]||l;return n?a.createElement(f,o(o({ref:t},u),{},{components:n})):a.createElement(f,o({ref:t},u))}));function f(e,t){var n=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var l=n.length,o=new Array(l);o[0]=m;var s={};for(var i in t)hasOwnProperty.call(t,i)&&(s[i]=t[i]);s.originalType=e,s[d]="string"==typeof e?e:r,o[1]=s;for(var c=2;c<l;c++)o[c]=n[c];return a.createElement.apply(null,o)}return a.createElement.apply(null,n)}m.displayName="MDXCreateElement"},5975:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>i,contentTitle:()=>o,default:()=>p,frontMatter:()=>l,metadata:()=>s,toc:()=>c});var a=n(87462),r=(n(67294),n(3905));const l={sidebar_position:4},o="Stats",s={unversionedId:"leader_stats",id:"leader_stats",title:"Stats",description:"Usage",source:"@site/docs/leader_stats.md",sourceDirName:".",slug:"/leader_stats",permalink:"/campingsite/docs/leader_stats",draft:!1,editUrl:"https://github.com/matyasjay/campingsite/edit/main/docs/leader_stats.md",tags:[],version:"current",sidebarPosition:4,frontMatter:{sidebar_position:4},sidebar:"defaultSidebar",previous:{title:"Items",permalink:"/campingsite/docs/items"}},i={},c=[{value:"Usage",id:"usage",level:2},{value:"Configuration",id:"configuration",level:3},{value:"Update the stats",id:"update-the-stats",level:3}],u={toc:c},d="wrapper";function p(e){let{components:t,...n}=e;return(0,r.kt)(d,(0,a.Z)({},u,n,{components:t,mdxType:"MDXLayout"}),(0,r.kt)("h1",{id:"stats"},"Stats"),(0,r.kt)("h2",{id:"usage"},"Usage"),(0,r.kt)("p",null,'Setup the default "leaderstats" ',"[Instance]",' in the Main script. The name has\nto be "leaderstats" since this is a built-in feature'),(0,r.kt)("h3",{id:"configuration"},"Configuration"),(0,r.kt)("p",null,"Configure the base stats in ",(0,r.kt)("inlineCode",{parentName:"p"},"src/Main.server.luau")," as:"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-lua"},'\nlocal leaderstats = Instance.new("Folder", player)\nleaderstats.Name = "leaderstats"\n\nlocal playerGold = Instance.new("NumberValue", leaderstats)\nplayerGold.Name = "Gold"\nplayerGold.Value = 0\n\nwhile task.wait(1) do\n  playerGold.Value += 10\nend\n')),(0,r.kt)("h3",{id:"update-the-stats"},"Update the stats"),(0,r.kt)("p",null,"You can change a stat as needed, here's an example that increases the amount\nof gold when the player touches ",(0,r.kt)("inlineCode",{parentName:"p"},"myItem")),(0,r.kt)("p",null,"In ",(0,r.kt)("inlineCode",{parentName:"p"},"src/Scripts/Items/MyItem.server.luau")," you can have something similar:"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-lua"},'local debounce = true\nmyItem.Touched:Connect(function(hit)\n  local character = hit.Parent\n  local humanoid = char:FindFirstChild("Humanoid")\n  local plr = game.Players:FindFirstChild(character.Name)\n  if humanoid and debounce then\n    debounce = false\n    local pStats = plr:WaitForChild("leaderstats")\n    local pGold = pStats.Gold\n    pGold.Value += 10\n    task.wait(1)\n    debounce = true\nend)\n')))}p.isMDXComponent=!0}}]);