---
sidebar_position: 2
---

# Architecture Overview

The current repository holds all the assets and code that the game requires to
run. Also an automated build process takes care of the intact state and creates
the latest `.rbxm` export file that could be imported directly into Roblox Studio.

## Project Structure

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

  :::info
  You can read more about how to use the configuration files on the [official Rojo documentation](https://rojo.space/docs/v7/project-format).
  However, this document tries to cover the most used features.
  :::

- `src`

  All the source code and exported models. The code written in `luau` and all
  scripts are inside the `Scripts` directory while exported `.rbxm` files are
  found inside `Models` for clarity.

:::note
The above list of root directories does not cover the additional files and directories
for managing source control workflows, global scripts or sourcemaps.
:::

## Runtime Variants

### Client

### Server

## Scripts In Roblox

### Server Storage

### Replicated Storage

### Starter Pack

### Server Scripts

### Player Scripts

### Character Scripts
