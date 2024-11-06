"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[3566],{78853:t=>{t.exports=JSON.parse('{"functions":[{"name":"Get","desc":"","params":[{"name":"name","desc":"","lua_type":"string"}],"returns":[{"desc":"","lua_type":"Entry"}],"function_type":"static","source":{"line":55,"path":"src/Scripts/Variables/Statistics.luau"}},{"name":"GetAll","desc":"","params":[],"returns":[{"desc":"","lua_type":"{Entry}"}],"function_type":"static","source":{"line":68,"path":"src/Scripts/Variables/Statistics.luau"}},{"name":"Set","desc":"","params":[{"name":"attributes","desc":"","lua_type":"{Entry}"}],"returns":[],"function_type":"static","source":{"line":83,"path":"src/Scripts/Variables/Statistics.luau"}},{"name":"Put","desc":"","params":[{"name":"name","desc":"","lua_type":"string"},{"name":"value","desc":"","lua_type":"number"}],"returns":[],"function_type":"static","source":{"line":99,"path":"src/Scripts/Variables/Statistics.luau"}}],"properties":[{"name":"attributes","desc":"","lua_type":"{ [string]: Entry }","private":true,"source":{"line":48,"path":"src/Scripts/Variables/Statistics.luau"}}],"types":[{"name":"Entry","desc":"","lua_type":"{ [string]: NumberValue }","private":true,"source":{"line":42,"path":"src/Scripts/Variables/Statistics.luau"}}],"name":"Statistics","desc":"The `Statistics` module securely manages [Player]-specific attributes, providing\\nmethods to _retrieve_, _set_, and _update_ these attributes through a controlled\\ninterface. \\n\\nIntegrating with the [Persona](/api/Persona) class, it accesses player data and\\norganizes attributes within a private collection (`Statistics.attributes`).\\n\\nMethods allow flexible yet safe updates to individual or bulk attributes.\\n\\n:::warning \\n\\n**Direct access on a private class property could lead to unexpected behaviour.**\\n\\n:::\\n\\n## Usage\\n\\n```lua\\nlocal ReplicatedStorage = game:GetService(\\"ReplicatedStorage\\")\\nlocal Statistics = require(ReplicatedStorage.Variables:WaitForChild(\\"Statistics\\"))\\n\\nprint(Statistics.Get())\\n```","tags":["Player Variables","Variable Collection"],"source":{"line":30,"path":"src/Scripts/Variables/Statistics.luau"}}')}}]);