# Camp with Me in R(oblox)ojo Land!

**Sneak Peek**: [Project Preview](https://share.zight.com/2Nuooqkk)

This repository is a full-game setup for Roblox Studio using [Rojo](https://github.com/rojo-rbx/rojo). It includes all assets, scripts, models, and tools that make up the game environment.

> **Note**  
> The _Campingsite_ project is a personal learning sandbox and includes experimental solutions not intended for serious gameplay. While it serves as a development playground, each iteration is published on Roblox Hub as a public experience, so it remains accessible and playable in the Roblox Client.

![Camp Site Preview](https://wallpaperaccess.com/full/181080.jpg)

## Build and run

### Starting the Rojo Server

To launch the project in Roblox Studio, start the Rojo server by running:

```sh
make serve
```

This command merges the files in the `project` folder and generates the `default.project.json` file in the root directory.

Once the Rojo server is running, connect to it using the Rojo Plugin in Roblox Studio.

### Building the Project

To manually build the project, execute:

This command generates the `default.project.json` file in the root directory. Additionally, pushing to the `main` branch triggers a GitHub Action that builds the project and outputs the compiled game file as `build/latest.rbxm`.

The `build/latest.rbxm` file is equivalent to the output from running `rojo build ...`.

```sh
make build
```
