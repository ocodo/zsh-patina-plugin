# IMPORTANT: IN BETA DEVELOPMENT.

# zsh-patina-plugin

A minimal plugin/bundle integration wrapper for [`zsh-patina`](https://github.com/michel-kraemer/zsh-patina).
For use with zsh-plugin/bundle managers such as [Antidote](https://antidote.sh), Zinit, Antibody, Antigen, etc.

What the bundle does:

- activate `zsh-patina`
- enable `zsh-patina` completion support

# Prerequisites

Install `zsh-patina` using your package manager or use the releases direct from [`zsh-patina`](https://github.com/michel-kraemer/zsh-patina).

Recommended: use your system package manager to remain up to date with the latest release.


# Install

Add  `ocodo/zsh-patina-plugin`  to your zsh-plugin manager setup.

e.g. 
- For Antidote, add to `~/.zsh_plugins.txt`
  ```
  ocodo/zsh-patina-plugin
  ```
- For Zinit add to your zinit setup in `.zshrc`:
  ```
  zinit light ocodo/zsh-patina-plugin
  ``` 
- For Antigen add to your antigen setup in `.zshrc`:
  ```
  antigen bundle ocodo/zsh-patina-plugin
  ```

See your favorite plugin manager docs for full setup docs.

# Troubleshooting

Zsh syntax highlighting will be applied in the order of your zsh plugin installs, so it's recommended that you place `ocodo/zsh-patina-plugin` at the end of your config.

# Reporting issues

Report issues with this plugin wrapper to [/issues](/issues)

Report issues for zsh-patina at [`michel-kraemer/zsh-patina`](https://github.com/michel-kraemer/zsh-patina/issues)

# License

This plugin wrapper is licensed under GNU GPL v3
