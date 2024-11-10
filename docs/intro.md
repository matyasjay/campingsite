---
sidebar_position: 1
---

# Getting Started

## Welcome

This project is a sandbox game designed to help users explore and learn Roblox
development through a partially-managed Rojo setup. The documentation provides an
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

### Prerequisites

- [Roblox Studio](https://create.roblox.com/docs/studio/setting-up-roblox-studio)

  Roblox Studio is an all-in-one IDE that lets you create experiences that run on
  Roblox. It's free to use and lets you reach millions of users using the Roblox
  app on console, desktop, and mobile devices.

- [Git](https://git-scm.com)

  Git is a free and open source distributed version control system designed to
  handle everything from small to very large projects with speed and efficiency.

- [Rojo](https://rojo.space/docs/v7)

  Rojo is a project management tool designed to get professional resources in
  the hands of Roblox developers.

- [Rojo Plugin](https://rojo.space/docs/v7/getting-started/installation/#installing-the-plugin)

  Once you've installed the Rojo server, you can use it to install or upgrade
  the Rojo plugin which will sync changes to Roblox Studio.

- [Luau Language Server Companion](https://create.roblox.com/store/asset/10913122509/Luau-Language-Server-Companion?externalSource=www)

  Companion plugin to the Luau Language Server ([Luau LSP](https://github.com/JohnnyMorganz/luau-lsp)). This plugin allows the instance
  tree to be inferred from Studio, to provide better language features.

- [Node.js](https://nodejs.org/en) - _(optional to work on the documentation)_

  Node.js® is a free, open-source, cross-platform JavaScript runtime environment
  that lets developers create servers, web apps, command line tools and scripts.

- [Moonwave](https://eryn.io/moonwave/docs/intro) - _(optional to work on the documentation)_

  Moonwave is three things: a plugin for [Docusaurus](https://docusaurus.io), a command line tool, and a
  parser, which generates JSON from your doc comments, which can also be consumed
  by many different tools.

### Rojo Server

Rojo is the core tool for this sandbox, enabling synchronization between the local
codebase and a running Roblox Studio instance. Rojo manages scripts and replicated
elements.

After checking out the code from source control, open a terminal and run the
`make serve` command. This will build the main project file (`default.project.json`)
and start the server, which can then be connected to the Rojo plugin in Roblox Studio.

:::info Install and configure Rojo CLI
For more detailed instructions please visit the official **[Rojo Website](https://rojo.space/docs/v7/getting-started/installation/)**
where you can find all the details on how to setup your system to be able to
use the Rojo services.
:::

### Sync Changes

As you work on scripts, the service will automatically sync local changes.

If any project files change, you’ll need to rebuild the project by stopping the
current server and running `make serve` again. The process will fail if there are
errors in any of the project configuration files.

Once everything is set up and ready, you’re all set to start creating. Enjoy!
