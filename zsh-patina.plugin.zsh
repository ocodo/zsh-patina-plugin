# zsh-patina.plugin.zsh
#
# Zsh integration wrapper for zsh-patina

if (( ! $+commands[zsh-patina] )); then
    print -u2 "zsh-patina: command not found"
    print -u2 "Install zsh-patina using your preferred package manager."
    print -u2 "See https://github.com/michel-kraemer/zsh-patina for installation options."
    return 1
fi

eval "$(zsh-patina activate)"

# zsh-patina completion support
#
# Generated completion is kept separate from plugin-managed files.
# compinit/compaudit remain the responsibility of the plugin manager/user.

local completion_dir="${ZDOTDIR:-~}/.cache/zsh-patina/completions"
local completion_file="$completion_dir/_zsh-patina"

if [[ ! -r "$completion_file" ]]; then
    mkdir -p "$completion_dir"
    chmod go-w "$completion_dir"

    zsh-patina completion --output-file "$completion_file" || {
        print -u2 "zsh-patina: failed to generate completion"
        return 1
    }

    chmod go-w "$completion_file"
fi

fpath=("$completion_dir" $fpath)
