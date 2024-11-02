<p align="center">
  <img src="https://github.com/matyasjay/campingsite/blob/main/.moonwave/static/favicon.png?raw=true" width="350px"/>
</p>

<h1 align="center">Camping in R(oblox)ojo Land!</h1>

![GitHub Release](https://img.shields.io/github/v/release/matyasjay/campingsite)
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/matyasjay/campingsite/.github%2Fworkflows%2Fbuild.yml)
![Static Badge](https://img.shields.io/badge/Luau-Roblox-blue)
![Static Badge](https://img.shields.io/badge/Rojo-v7-orange)

**Play this game online at [Roblox.com](https://www.roblox.com/games/117153514135869/Camping)!**

This repository is a fully managed setup for Roblox Studio using [Rojo](https://github.com/rojo-rbx/rojo).
It includes all assets, scripts, models, and tools that make up the game environment.

> [!NOTE]
> The _campingsite_ project is a personal learning sandbox and includes
> experimental solutions not intended for serious gameplay. While it serves
> as a development playground, each iteration is published on Roblox Hub as
> a public experience, so it remains accessible and playable in the Roblox Client.

## Features

The game's objective is to light a fire in the fireplace. Players gather logs by chopping trees and collect stone and flint by mining rocks. Each player starts with the necessary tools in their inventory and receives guidance through wooden signs. All gathered resources must be placed on the firepit, and once complete, the fire lights automatically. After a short delay, players can choose to play again, which resets the game to its initial state.

- Camp area with trees to chop, rocks to mine, and a central fireplace
- Axe and pickaxe provided for resource gathering
- Progress feedback through wooden signs
- Option to replay after lighting the fire
- Store and track player stats (visits, logs chopped, stone, flint picked and tools swinged) on the server

## Preview

https://github.com/user-attachments/assets/8e6e6567-43ef-4fc7-a265-0e550b105c6b

## Development

Visit the [API documentation](https://matyasjay.github.io/campingsite) to see the available classes and functions to use when developing this project!

### Starting the Rojo Server

To launch the project in Roblox Studio, start the Rojo server by running:

```sh
make serve
```

This command merges the files in the `project` folder and generates
the `default.project.json` file in the root directory.

Once the Rojo server is running, connect to it using the Rojo Plugin in Roblox Studio.

### Building the Project

To manually build the project, execute:

```sh
make build
```

This command generates the `default.project.json` file in the root directory.
Additionally, pushing to the `main` branch triggers a GitHub Action that builds
the project and outputs the compiled game file as `build/latest.rbxm`.

The `build/latest.rbxm` file is equivalent to the output from running `rojo build -o build/latest.rbxm`.

> [!IMPORTANT]
>
> ## Known Issues
>
> - You need to manually restart Rojo Server to make project file changes applied

### Testing

The project uses LuaUnit as its generic native Lua test framework.
