"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[892],{38444:e=>{e.exports=JSON.parse('{"functions":[{"name":"GetPlayers","desc":"Get all [Player] objects that are currently in the game.","params":[],"returns":[{"desc":"The table of online [Player] objects","lua_type":"{Player}"}],"function_type":"static","source":{"line":15,"path":"src/Toolkits/Persona.luau"}},{"name":"GetCurrentPlayer","desc":"Get the current local [Player] object.","params":[],"returns":[{"desc":"The current [Player] object","lua_type":"Player"}],"function_type":"static","realm":["Client"],"source":{"line":26,"path":"src/Toolkits/Persona.luau"}},{"name":"GetCurrentCharacter","desc":"Get the current local [Player#Character] object.","params":[],"returns":[{"desc":"The [Player#Character] model of the current [Player]","lua_type":"Model"}],"function_type":"static","realm":["Client"],"source":{"line":37,"path":"src/Toolkits/Persona.luau"}},{"name":"GetCharacterFromPlayer","desc":"Get the [Player#Character] object from a [Player] object.","params":[{"name":"player","desc":"The [Player] to get the [Player#Character] from","lua_type":"Player"}],"returns":[{"desc":"The [Player#Character] model of the given [Player]","lua_type":"Model"}],"function_type":"static","source":{"line":49,"path":"src/Toolkits/Persona.luau"}},{"name":"GetPlayerFromCharacter","desc":"Get the [Player] object from a [Player#Character] object.","params":[{"name":"character","desc":"The [Player#Character] to get the [Player] from","lua_type":"Model"}],"returns":[{"desc":"The [Player] object of the given [Player#Character]","lua_type":"Player"}],"function_type":"static","source":{"line":60,"path":"src/Toolkits/Persona.luau"}},{"name":"GetCurrentHumanoid","desc":"Get the [Humanoid] object of the current [Player].","params":[],"returns":[{"desc":"The [Humanoid] object of the current [Player]","lua_type":"Humanoid"}],"function_type":"static","realm":["Client"],"source":{"line":77,"path":"src/Toolkits/Persona.luau"}},{"name":"GetAttribute","desc":"Get a specific attribute of the current [Player].","params":[{"name":"attribute","desc":"The name of the current [Player]\'s attribute","lua_type":"string"}],"returns":[{"desc":"The [ValueBase] table of the current [Player]","lua_type":"{ValueBase}"}],"function_type":"static","realm":["Client"],"source":{"line":89,"path":"src/Toolkits/Persona.luau"}},{"name":"GetPlayerAttribute","desc":"Get a specific attribute of the given [Player] object.","params":[{"name":"attribute","desc":"The name of the requested attribute","lua_type":"string"},{"name":"player","desc":"The [Player] object to get the attribute from","lua_type":"Player"}],"returns":[{"desc":"The [ValueBase] table of the current [Player]","lua_type":"{ValueBase}"}],"function_type":"static","source":{"line":101,"path":"src/Toolkits/Persona.luau"}}],"properties":[],"types":[],"name":"Persona","desc":"This class provides utilities to access the localPlayer pool of all the [Players] or get the current [Player]\\nand their decendants (i.e: [Humanoid], [Player#Character]...etc) without too much boilerplate.","tags":["Toolkit"],"source":{"line":8,"path":"src/Toolkits/Persona.luau"}}')}}]);