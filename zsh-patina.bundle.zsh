# zsh-patina.bundle.zsh
#
# Zsh integration bundle for zsh-patina
# https://github.com/michel-kraemer/zsh-patina
if (( $+commands[zsh-patina] )); then
    eval "$(zsh-patina activate)"

    # zsh-patina completion support
    if (( ! $+functions[_zsh-patina] )); then
	eval "$(zsh-patina completion)"
    fi
fi

print -u2 "zsh-patina: command not found"
print -u2 "Install zsh-patina using your preferred package manager."
print -u2 "See https://github.com/michel-kraemer/zsh-patina for installation options."
