"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[892],{38444:e=>{e.exports=JSON.parse('{"functions":[{"name":"GetCurrentPlayer","desc":"Get the current local [Player] object.","params":[],"returns":[{"desc":"The current [Player] object","lua_type":"Player"}],"function_type":"static","realm":["Client"],"source":{"line":44,"path":"src/Toolkits/Persona.luau"}},{"name":"GetCurrentCharacter","desc":"Get the current local [Player#Character] object.","params":[],"returns":[{"desc":"The [Player#Character] model of the current [Player]","lua_type":"Model"}],"function_type":"static","realm":["Client"],"source":{"line":58,"path":"src/Toolkits/Persona.luau"}},{"name":"GetCharacterFromPlayer","desc":"Get the current [Player#Character] object from a [Player] object.","params":[{"name":"player","desc":"The [Player] to get the [Player#Character] from","lua_type":"Player"}],"returns":[{"desc":"The [Player#Character] model of the given [Player]","lua_type":"Model"}],"function_type":"static","realm":["Server"],"source":{"line":70,"path":"src/Toolkits/Persona.luau"}},{"name":"GetCurrentHumanoid","desc":"Get the [Humanoid] object of the current [Player].","params":[],"returns":[{"desc":"The [Humanoid] object of the current [Player]","lua_type":"Humanoid"}],"function_type":"static","realm":["Client"],"source":{"line":80,"path":"src/Toolkits/Persona.luau"}},{"name":"GetPlayerVariable","desc":"Get a specific variable of the current [Player].","params":[{"name":"variable","desc":"","lua_type":"string"}],"returns":[{"desc":"The [ValueBase] table of the current [Player]","lua_type":"{ValueBase}"}],"function_type":"static","realm":["Client"],"source":{"line":90,"path":"src/Toolkits/Persona.luau"}},{"name":"GetPlayerVariableFromPlayer","desc":"Get a specific variable of the current [Player].","params":[{"name":"variable","desc":"The name of the requested variable","lua_type":"string"},{"name":"player","desc":"The [Player] object to get the variable from","lua_type":"Player"}],"returns":[{"desc":"The [ValueBase] table of the current [Player]","lua_type":"{ValueBase}"}],"function_type":"static","realm":["Server"],"source":{"line":103,"path":"src/Toolkits/Persona.luau"}}],"properties":[{"name":"players","desc":"The [Players] that are currently available in the game","lua_type":"Players","private":true,"source":{"line":17,"path":"src/Toolkits/Persona.luau"}},{"name":"workspace","desc":"The current [Workspace] object","lua_type":"Workspace","private":true,"source":{"line":26,"path":"src/Toolkits/Persona.luau"}},{"name":"player","desc":"The current [LocalPlayer] object","lua_type":"Player","realm":["Client"],"private":true,"source":{"line":36,"path":"src/Toolkits/Persona.luau"}}],"types":[],"name":"Persona","desc":"This class provides utilities to access the player pool of all the [Players] or get the current [Player]\\nand their decendants (i.e: [Humanoid], [Player#Character]...etc) without too much boilerplate.","tags":["Toolkit"],"source":{"line":8,"path":"src/Toolkits/Persona.luau"}}')}}]);