---
sidebar_position: 2
---

# Architecture Overview

:::note Disclaimer
Most of the following sections are copied from the [Roblox Documentation](https://create.roblox.com/docs/projects)
as is. They are included in the current document to provide contextual clarity
about terms and concepts used in the project.
:::

The current repository holds all the code that the game requires to run as well
as some replicated models. Also an automated build process takes care of the intact
state and creates the latest `.rbxm` export file that could be imported directly
into Roblox Studio.

## Definitions

### Data Model

Every place is represented by a data model, a hierarchy of objects that describe
everything about the place. The data model contains all objects that make up the
3D world, such as parts, terrain, lighting, and other environmental elements.
It also contains objects that can control runtime behavior, such as scripts that
modify properties, call methods and functions, and respond to events that enable
dynamic behavior and interactivity.

The Roblox engine uses the data model as a source of truth for a place's state,
so it can simulate and render it on client devices.

### Client-Server Runtime

Roblox experiences are multiplayer by default and run in a client-server model.
The Roblox server is the ultimate authority for maintaining the experience's state,
and is responsible for keeping all connected clients in sync with the server.

### Objects

You place and organize objects in the data model to describe a place in Roblox.
Every object in Roblox inherits from the Instance class, which defines generic
properties, methods, and events that are common to all objects. Objects also define
their own characteristics depending on the functionality the object provides.

### Server Storage

Contains objects that are only meant for server use. You can use this container
to store objects that you want to clone and parent to the workspace or other
containers at runtime. For example, you can store large objects such as maps in
this container until they are needed and move them into the workspace only when
required This lets you decrease client network traffic on initial join.

### Replicated Storage

Contains objects that are available to both the server and connected clients.
Any changes that occur on the client persist but won't be replicated to the server.
The server can overwrite changes on the client to maintain consistency.
In addition, you can use this container to replicate any objects that don't need
to exist in the 3D world until needed for cloning and parenting to all incoming
character models.

### Starter Pack

Scripts that set up the player's inventory and generally contain [Tool](/docs/tools-and-equipment)
objects but often contains local scripts as well.

### Server Scripts

Contains script objects that are required by server scripts, and other scripting
-related objects that are only meant for server use. If your scripts require other,
non-scripting objects, you must place them in ServerStorage. Scripts in this container
are never replicated to clients, which allows you to have secure, server-side logic.

### Player Scripts

All objects you store in these containers are non-persistent across sessions and
reset every time a client rejoins. You can put objects in these containers such
as player GUIs, client-side scripts, and other objects that are only relevant to the client.

### Character Scripts

Scripts that are copied to the client when they spawn. These scripts do not persist
when the player respawns.

## Structure

Since Rojo is a filesystem based tool, the structure of the codebase and related
assets are quite important. There were many iterations already to refine and get
the optimal results. According to the current state, the root level directories
and their roles are the following:

- `build`

  This directory holds the script to build the project files into a single instance
  _(explained below)_ and the latest build output, the `latest.rbxm` file

- `project`

  The actual Rojo configuration is the result of merging all `.project.json`
  files in the `project` directory. The project files are split into multiple
  scopes like `Meta`, `Scripts`, `Storage`, `Tools` and so on. The reason is
  separation of concerns and to make configuration objects not too overwhelming.

  You can check out the [example project configurations](https://rojo.space/docs/v7/project-format/#example-projects)
  to get an idea about the syntax and how to manage different aspects of the game
  at the project configuration level.

- `src`

  All the source code and exported models. The code written in `luau` and all
  scripts are inside the `Scripts` directory while exported `.rbxm` files are
  found inside `Models` for clarity.
