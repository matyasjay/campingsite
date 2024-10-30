# Camping in R(oblox)ojo Land!

**Sneak Peek**: [Project Preview](https://share.zight.com/2Nuooqkk)

**Latest Uploaded Version: [Roblox.com](https://www.roblox.com/games/117153514135869/Camping)**

This repository is a fully managed setup for Roblox Studio using [Rojo](https://github.com/rojo-rbx/rojo).
It includes all assets, scripts, models, and tools that make up the game environment.

> [!NOTE]
> The _campingsite_ project is a personal learning sandbox and includes
> experimental solutions not intended for serious gameplay. While it serves
> as a development playground, each iteration is published on Roblox Hub as
> a public experience, so it remains accessible and playable in the Roblox Client.

![Camp Site Preview](https://wallpaperaccess.com/full/181080.jpg)

## Features

The game's objective is to light a fire in the fireplace. Players gather logs by chopping trees and collect stone and flint by mining rocks. Each player starts with the necessary tools in their inventory and receives guidance through wooden signs. All gathered resources must be placed on the firepit, and once complete, the fire lights automatically. After a short delay, players can choose to play again, which resets the game to its initial state.

- Camp area with trees to chop, rocks to mine, and a central fireplace
- Axe and pickaxe provided for resource gathering
- Progress feedback through wooden signs
- Option to replay after lighting the fire

## Development

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
