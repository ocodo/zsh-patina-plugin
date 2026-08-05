# NOTE in public ALPHA test

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

The plugin entry point is:

```zsh
zsh-patina.plugin.zsh
````

On first load:

1. the plugin checks for `zsh-patina`
2. downloads the matching upstream release if required
3. installs the binary
4. generates activation code
5. sources the generated initialization

Subsequent loads use the installed binary and cached initialization.

## Configuration

Binary location:

```zsh
XDG_BIN_HOME
```

defaults to:

```text
~/.local/bin
```

Activation cache location:

```zsh
XDG_CACHE_HOME
```

defaults to:

```text
~/.cache/zsh-patina
```

## License

GPL-3.0-or-later.


