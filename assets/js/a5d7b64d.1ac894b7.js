"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[412],{54020:e=>{e.exports=JSON.parse('{"functions":[{"name":"LoadAnimation","desc":"Loads the animation referenced by its Asset ID to the provided humanoid.","params":[{"name":"humanoid","desc":"The humanoid object to load the animation to","lua_type":"Humanoid"},{"name":"animationId","desc":"The Asset ID of the animation to be loaded","lua_type":"string"}],"returns":[{"desc":"True when the animation was properly loaded and executed","lua_type":"boolean"}],"function_type":"static","source":{"line":35,"path":"src/Toolkits/Animate.luau"}},{"name":"PlayAnimation","desc":"Play the currently loaded animation.","params":[{"name":"humanoid","desc":"","lua_type":"Humanoid"}],"returns":[],"function_type":"static","private":true,"source":{"line":51,"path":"src/Toolkits/Animate.luau"}},{"name":"GetAnimationId","desc":"Get the Asset ID of the given animation stored in the Shared storage.","params":[{"name":"animationName","desc":"The name of the requested animation","lua_type":"string"}],"returns":[{"desc":"The Asset ID of the requested animation","lua_type":"string"}],"function_type":"static","source":{"line":66,"path":"src/Toolkits/Animate.luau"}},{"name":"LoadAnimationOnChange","desc":"Load the given animation referenced by its Asset ID when the provided boolean\\nvalue has been changed.","params":[{"name":"boolValue","desc":"The BoolValue to connect to","lua_type":"BoolValue"},{"name":"animationId","desc":"The Asset ID of the animation to be loaded","lua_type":"string"}],"returns":[],"function_type":"static","source":{"line":78,"path":"src/Toolkits/Animate.luau"}}],"properties":[{"name":"animation","desc":"","lua_type":"Animation","private":true,"source":{"line":19,"path":"src/Toolkits/Animate.luau"}},{"name":"debounce","desc":"","lua_type":"boolean","private":true,"source":{"line":26,"path":"src/Toolkits/Animate.luau"}}],"types":[],"name":"Animate","desc":"This class is responsible to handle animation loading and playing within\\nthe game. The methods providing abstract functionality to handle common\\ntasks with ease. See individual documentation for details and capabilities.","tags":["Toolkit"],"source":{"line":12,"path":"src/Toolkits/Animate.luau"}}')}}]);