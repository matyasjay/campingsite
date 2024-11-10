"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[9671],{3905:(e,t,n)=>{n.d(t,{Zo:()=>c,kt:()=>h});var o=n(67294);function r(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function a(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);t&&(o=o.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,o)}return n}function i(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?a(Object(n),!0).forEach((function(t){r(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):a(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function l(e,t){if(null==e)return{};var n,o,r=function(e,t){if(null==e)return{};var n,o,r={},a=Object.keys(e);for(o=0;o<a.length;o++)n=a[o],t.indexOf(n)>=0||(r[n]=e[n]);return r}(e,t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(o=0;o<a.length;o++)n=a[o],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(r[n]=e[n])}return r}var s=o.createContext({}),p=function(e){var t=o.useContext(s),n=t;return e&&(n="function"==typeof e?e(t):i(i({},t),e)),n},c=function(e){var t=p(e.components);return o.createElement(s.Provider,{value:t},e.children)},u="mdxType",d={inlineCode:"code",wrapper:function(e){var t=e.children;return o.createElement(o.Fragment,{},t)}},m=o.forwardRef((function(e,t){var n=e.components,r=e.mdxType,a=e.originalType,s=e.parentName,c=l(e,["components","mdxType","originalType","parentName"]),u=p(n),m=r,h=u["".concat(s,".").concat(m)]||u[m]||d[m]||a;return n?o.createElement(h,i(i({ref:t},c),{},{components:n})):o.createElement(h,i({ref:t},c))}));function h(e,t){var n=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var a=n.length,i=new Array(a);i[0]=m;var l={};for(var s in t)hasOwnProperty.call(t,s)&&(l[s]=t[s]);l.originalType=e,l[u]="string"==typeof e?e:r,i[1]=l;for(var p=2;p<a;p++)i[p]=n[p];return o.createElement.apply(null,i)}return o.createElement.apply(null,n)}m.displayName="MDXCreateElement"},59881:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>s,contentTitle:()=>i,default:()=>d,frontMatter:()=>a,metadata:()=>l,toc:()=>p});var o=n(87462),r=(n(67294),n(3905));const a={sidebar_position:1},i="Getting Started",l={unversionedId:"intro",id:"intro",title:"Getting Started",description:"Welcome",source:"@site/docs/intro.md",sourceDirName:".",slug:"/intro",permalink:"/campingsite/docs/intro",draft:!1,editUrl:"https://github.com/matyasjay/campingsite/edit/main/docs/intro.md",tags:[],version:"current",sidebarPosition:1,frontMatter:{sidebar_position:1},sidebar:"defaultSidebar",next:{title:"Architecture Overview",permalink:"/campingsite/docs/architecture"}},s={},p=[{value:"Welcome",id:"welcome",level:2},{value:"Goals",id:"goals",level:2},{value:"Learning",id:"learning",level:3},{value:"Experience",id:"experience",level:3},{value:"Development",id:"development",level:2},{value:"Prerequisites",id:"prerequisites",level:3},{value:"Rojo Server",id:"rojo-server",level:3},{value:"Sync Changes",id:"sync-changes",level:3}],c={toc:p},u="wrapper";function d(e){let{components:t,...n}=e;return(0,r.kt)(u,(0,o.Z)({},c,n,{components:t,mdxType:"MDXLayout"}),(0,r.kt)("h1",{id:"getting-started"},"Getting Started"),(0,r.kt)("h2",{id:"welcome"},"Welcome"),(0,r.kt)("p",null,"This project is a sandbox game designed to help users explore and learn Roblox\ndevelopment through a partially-managed Rojo setup. The documentation provides an\noverview of the game's main features and a high-level explanation of the implemented ideas."),(0,r.kt)("p",null,"The documentation is divided into two main parts:"),(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},"This overview, which summarizes the key features, ideas, and solutions in the project."),(0,r.kt)("li",{parentName:"ul"},"The API documentation, generated directly from the code, which covers technical\ndetails and usage instructions for developers.")),(0,r.kt)("h2",{id:"goals"},"Goals"),(0,r.kt)("h3",{id:"learning"},"Learning"),(0,r.kt)("p",null,"The primary purpose of this project is to build skills for creating unique content\nand game mechanics in Roblox and Roblox Studio. To make learning more engaging\nand challenging, the project incorporates custom tools alongside the standard Roblox\nworkflow, offering added flexibility and deepening knowledge."),(0,r.kt)("h3",{id:"experience"},"Experience"),(0,r.kt)("p",null,"This sandbox aims to deliver a cohesive and engaging experience, rather than a\ncollection of isolated mechanics. Each development iteration introduces new features\ndesigned to increase player engagement and enhance the core gameplay. Detailed\nexplanations of current gameplay features are provided in the following sections."),(0,r.kt)("h2",{id:"development"},"Development"),(0,r.kt)("p",null,"As this project focuses on technical exploration, the emphasis is on continuous\ndevelopment and enhancing the existing codebase. Before getting started, ensure\nyou meet the following requirements listed below."),(0,r.kt)("h3",{id:"prerequisites"},"Prerequisites"),(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},(0,r.kt)("a",{parentName:"p",href:"https://create.roblox.com/docs/studio/setting-up-roblox-studio"},"Roblox Studio")),(0,r.kt)("p",{parentName:"li"},"Roblox Studio is an all-in-one IDE that lets you create experiences that run on\nRoblox. It's free to use and lets you reach millions of users using the Roblox\napp on console, desktop, and mobile devices.")),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},(0,r.kt)("a",{parentName:"p",href:"https://git-scm.com"},"Git")),(0,r.kt)("p",{parentName:"li"},"Git is a free and open source distributed version control system designed to\nhandle everything from small to very large projects with speed and efficiency.")),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},(0,r.kt)("a",{parentName:"p",href:"https://rojo.space/docs/v7"},"Rojo")),(0,r.kt)("p",{parentName:"li"},"Rojo is a project management tool designed to get professional resources in\nthe hands of Roblox developers.")),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},(0,r.kt)("a",{parentName:"p",href:"https://rojo.space/docs/v7/getting-started/installation/#installing-the-plugin"},"Rojo Plugin")),(0,r.kt)("p",{parentName:"li"},"Once you've installed the Rojo server, you can use it to install or upgrade\nthe Rojo plugin which will sync changes to Roblox Studio.")),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},(0,r.kt)("a",{parentName:"p",href:"https://create.roblox.com/store/asset/10913122509/Luau-Language-Server-Companion?externalSource=www"},"Luau Language Server Companion")),(0,r.kt)("p",{parentName:"li"},"Companion plugin to the Luau Language Server (",(0,r.kt)("a",{parentName:"p",href:"https://github.com/JohnnyMorganz/luau-lsp"},"Luau LSP"),"). This plugin allows the instance\ntree to be inferred from Studio, to provide better language features.")),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},(0,r.kt)("a",{parentName:"p",href:"https://nodejs.org/en"},"Node.js")," - ",(0,r.kt)("em",{parentName:"p"},"(optional to work on the documentation)")),(0,r.kt)("p",{parentName:"li"},"Node.js\xae is a free, open-source, cross-platform JavaScript runtime environment\nthat lets developers create servers, web apps, command line tools and scripts.")),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},(0,r.kt)("a",{parentName:"p",href:"https://eryn.io/moonwave/docs/intro"},"Moonwave")," - ",(0,r.kt)("em",{parentName:"p"},"(optional to work on the documentation)")),(0,r.kt)("p",{parentName:"li"},"Moonwave is three things: a plugin for ",(0,r.kt)("a",{parentName:"p",href:"https://docusaurus.io"},"Docusaurus"),", a command line tool, and a\nparser, which generates JSON from your doc comments, which can also be consumed\nby many different tools."))),(0,r.kt)("h3",{id:"rojo-server"},"Rojo Server"),(0,r.kt)("p",null,"Rojo is the core tool for this sandbox, enabling synchronization between the local\ncodebase and a running Roblox Studio instance. Rojo manages scripts and replicated\nelements."),(0,r.kt)("p",null,"After checking out the code from source control, open a terminal and run the\n",(0,r.kt)("inlineCode",{parentName:"p"},"make serve")," command. This will build the main project file (",(0,r.kt)("inlineCode",{parentName:"p"},"default.project.json"),")\nand start the server, which can then be connected to the Rojo plugin in Roblox Studio."),(0,r.kt)("admonition",{title:"Install and configure Rojo CLI",type:"info"},(0,r.kt)("p",{parentName:"admonition"},"For more detailed instructions please visit the official ",(0,r.kt)("strong",{parentName:"p"},(0,r.kt)("a",{parentName:"strong",href:"https://rojo.space/docs/v7/getting-started/installation/"},"Rojo Website")),"\nwhere you can find all the details on how to setup your system to be able to\nuse the Rojo services.")),(0,r.kt)("h3",{id:"sync-changes"},"Sync Changes"),(0,r.kt)("p",null,"As you work on scripts, the service will automatically sync local changes."),(0,r.kt)("p",null,"If any project files change, you\u2019ll need to rebuild the project by stopping the\ncurrent server and running ",(0,r.kt)("inlineCode",{parentName:"p"},"make serve")," again. The process will fail if there are\nerrors in any of the project configuration files."),(0,r.kt)("p",null,"Once everything is set up and ready, you\u2019re all set to start creating. Enjoy!"))}d.isMDXComponent=!0}}]);