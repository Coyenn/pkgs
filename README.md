# Nix Packages

This repository contains Nix package definitions for various tools and utilities.

## Available Packages

| Package Name | Version | Description | Homepage |
|--------------|---------|-------------|----------|
| aftman | 0.3.0 | Aftman is a command line toolchain manager | [https://github.com/LPGhatguy/aftman](https://github.com/LPGhatguy/aftman) |
| argon | 2.0.26 | Argon - Full featured tool for Roblox development | [https://github.com/argon-rbx/argon](https://github.com/argon-rbx/argon) |
| asphalt | 1.2.0 | Upload and reference Roblox assets in code | [https://github.com/jackTabsCode/asphalt](https://github.com/jackTabsCode/asphalt) |
| darklua | 0.17.2 | A command line tool that transforms Lua 5.1 and Roblox Lua scripts using rules | [https://github.com/seaofvoices/darklua](https://github.com/seaofvoices/darklua) |
| lune | 0.10.4 | A standalone Luau runtime | [https://github.com/lune-org/lune](https://github.com/lune-org/lune) |
| moonwave | 1.3.0 | Moonwave is a tool for generating documentation from comments in Lua source code. | [https://github.com/evaera/moonwave](https://github.com/evaera/moonwave) |
| p | 1.4.0 | A simple project management tool for the command line written in Rust | [https://github.com/RevisionOrg/p](https://github.com/RevisionOrg/p) |
| pesde | 0.7.1 | A package manager for the Luau programming language, supporting multiple runtimes including Roblox and Lune | [https://github.com/pesde-pkg/pesde](https://github.com/pesde-pkg/pesde) |
| rojo | 7.6.1 | Enables professional-grade development tools for Roblox developers | [https://rojo.space](https://rojo.space) |
| rokit | 1.2.0 | Next-generation toolchain manager for Roblox projects | [https://github.com/rojo-rbx/rokit](https://github.com/rojo-rbx/rokit) |
| rostar | 0.2.0 | Dead simple fully managed Rojo helper for Roblox projects | [https://github.com/tacheometry/Rostar](https://github.com/tacheometry/Rostar) |
| selene | 0.29.0 | A blazing-fast modern Lua linter written in Rust | [https://github.com/Kampfkarren/selene](https://github.com/Kampfkarren/selene) |
| stylua | 2.3.1 | A Lua code formatter | [https://github.com/JohnnyMorganz/StyLua](https://github.com/JohnnyMorganz/StyLua) |
| tarmac | 0.8.2 | Resource compiler and asset manager for Roblox projects | [https://github.com/Roblox/tarmac](https://github.com/Roblox/tarmac) |
| wally | 0.3.2 | Package manager for Roblox | [https://github.com/UpliftGames/wally](https://github.com/UpliftGames/wally) |

## Usage

To use these packages, add this flake to your Nix configuration:

```nix
{
  inputs.rbx-pkgs-flake.url = "github:Coyenn/pkgs";
}
```

Then reference packages like:

```nix
{ rbx-pkgs-flake, ... }: {
  environment.systemPackages = [
    rbx-pkgs-flake.packages.${system}.pesde
    rbx-pkgs-flake.packages.${system}.rojo
  ];
}
```

## Updating Packages

Packages are automatically updated weekly via GitHub Actions. The README is automatically regenerated after each update.

