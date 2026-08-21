# zsh-patina-bundle

A minimal bundle integration wrapper for [`zsh-patina`](https://github.com/michel-kraemer/zsh-patina).
For use with zsh bundle/plugin managers such as [Antidote](https://antidote.sh), Zinit, Antibody, Antigen, etc.

What zsh-patina-bundle does:

- activate `zsh-patina`
- enable `zsh-patina` completion support

# Prerequisites

Install `zsh-patina` using your package manager or use the releases direct from [`zsh-patina`](https://github.com/michel-kraemer/zsh-patina).

Recommended: use your system package manager to remain up to date with the latest release.


# Install

Add  `ocodo/zsh-patina-bundle`  to your zsh bundle/plugin manager setup.

e.g. 
- For Antidote, add to `~/.zsh_plugins.txt`
  ```
  ocodo/zsh-patina-bundle
  ```
- For Zinit add to your zinit setup in `.zshrc`:
  ```
  zinit light ocodo/zsh-patina-bundle
  ``` 
- For Antigen add to your antigen setup in `.zshrc`:
  ```
  antigen bundle ocodo/zsh-patina-bundle
  ```

See your favorite bundle/plugin manager docs for full setup docs.

# Troubleshooting

Zsh syntax highlighting will be applied in the order of your zsh bundle/plugin setup, it's recommended that you place `ocodo/zsh-patina-bundle` at the end of your config, to avoid issues.

# Reporting issues

Report issues with zsh-patina-bundle to [**issues**](/issues)

Report issues for zsh-patina at [`michel-kraemer/zsh-patina`](https://github.com/michel-kraemer/zsh-patina/issues)

# License

Zsh-patina-bundle is licensed under GNU GPL v3
