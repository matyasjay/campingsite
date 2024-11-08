---
sidebar_position: 1
---

# Getting Started

## Welcome

This project is a sandbox game designed to help users explore and learn Roblox
development through a fully-managed Rojo setup. The documentation provides an
overview of the game's main features and a high-level explanation of the implemented ideas.

The documentation is divided into two main parts:

- This overview, which summarizes the key features, ideas, and solutions in the project.
- The API documentation, generated directly from the code, which covers technical
  details and usage instructions for developers.

## Goals

### Learning

The primary purpose of this project is to build skills for creating unique content
and game mechanics in Roblox and Roblox Studio. To make learning more engaging
and challenging, the project incorporates custom tools alongside the standard Roblox
workflow, offering added flexibility and deepening knowledge.

### Experience

This sandbox aims to deliver a cohesive and engaging experience, rather than a
collection of isolated mechanics. Each development iteration introduces new features
designed to increase player engagement and enhance the core gameplay. Detailed
explanations of current gameplay features are provided in the following sections.

## Development

As this project focuses on technical exploration, the emphasis is on continuous
development and enhancing the existing codebase. Before getting started, ensure
you meet the following requirements listed below.

- Roblox Studio
- Git
- Rojo
- Rojo Plugin
- Luau Language Server
- Node.js
- Moonwave

### Rojo Server

Rojo is the core tool for this sandbox, enabling synchronization between the local
codebase and a running Roblox Studio instance. Rojo manages all elements, including
models, scripts, and assets like meshes and images.

After checking out the code from source control, open a terminal and run the
`make serve` command. This will build the main project file (`default.project.json`)
and start the server, which can then be connected to the Rojo plugin in Roblox Studio.

:::info Install and configure Rojo CLI
For more detailed instructions please visit the official **[Rojo Website](https://rojo.space/docs/v7/getting-started/installation/)**
where you can find all the details on how to setup your system to be able to
use the Rojo services.
:::

### Sync Changes

As you work on scripts, the service will automatically sync local changes. However,
changes to the Workspace need to be exported each time they’re made. To minimize
this overhead, it’s best to plan and execute changes in models and export them only
when they’re finalized. The export format is standard `.rbxm`, and the main player area
is contained within a single model called `PlayArea`.

If any project files change, you’ll need to rebuild the project by stopping the
current server and running `make serve` again. The process will fail if there are
errors in any of the project configuration files.

Once everything is set up and ready, you’re all set to start creating. Enjoy!
