# zsh-patina-plugin

Zsh integration wrapper for [`zsh-patina`](https://github.com/michel-kraemer/zsh-patina).

This repository provides a sourceable `zsh-patina.plugin.zsh` file that:

- installs the `zsh-patina` binary from upstream releases when unavailable
- installs it into `${XDG_BIN_HOME:-$HOME/.local/bin}`
- generates and caches shell initialization code
- sources the generated initialization

The upstream `zsh-patina` project remains responsible for the binary and activation logic.

## Requirements

- Zsh
- `curl`
- `tar`
- `zsh-patina` release assets supported by the current platform

Supported platforms depend on the upstream `zsh-patina` release artifacts.

## Installation

Clone or bundle this repository using your preferred Zsh plugin manager.

### For Antidote

Add the following to `~/.zsh_plugins.txt`

```
ocodo/zsh-patina-plugin
```

### For Zinit

Add the following to your `.zshrc` 

```
zinit light ocodo/zsh-patina-plugin
```

### What it does

Fetch the binary if not installed, activate zsh-patina syntax highlighting and load completion.

#### Step by step

On first load:

1. check for `zsh-patina`
2. downloads the matching upstream release if required
3. installs the binary
4. generates activation code
5. sources the generated initialization
6. generates completion code for compinit

Subsequent loads use the installed binary and cached initialization, and activate completion and syntax highlighting.

## Trouble shooting

If you experience issues, first rule out `zsh-patina`

run each of the following steps.

1. `eval "$(zsh-patina activate)"`
2. `zsh-patina check`

if you have a warning about the line `eval "$(zsh-patina activate)"` not present in your `.zshrc` do not worry, it's being done by the plugin for you.

if you get other error messages, try `zsh-patina restart` and check that zsh syntax highlighting is working.  

If you still have issues, it is likely to be an issue with `zsh-patina`

## Zsh-patina binaries

If you first install the `zsh-patina` binary, the plugin will use that.

If not the plugin will install it for you from one of the following:

- Darwin (MacOS) arm64
- Darwin (MacOS) amd64
- Linux arm64
- Linux amd64

These are always sourced from [`zsh-patina`](https://github.com/michel-kraemer/zsh-patina/releases) 

If you require a different architecture target, I post an issue requesting and it will likely be added.

## License

GPL-3.0-or-later.


