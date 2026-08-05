# zsh-patina.plugin.zsh
#
# Zsh integration wrapper for zsh-patina
# https://github.com/michel-kraemer/zsh-patina

local repo="michel-kraemer/zsh-patina"
local bin_dir=${XDG_BIN_HOME:-$HOME/.local/bin}
local bin="$bin_dir/zsh-patina"
local cache_dir=${XDG_CACHE_HOME:-$HOME/.cache}/zsh-patina
local cache="$cache_dir/init.zsh"

if (( $+commands[zsh-patina] )); then
  bin=${commands[zsh-patina]}
fi

if [[ ! -x "$bin" ]]; then
  local target

  case "$(uname -s):$(uname -m)" in
    Darwin:arm64)
      target="aarch64-apple-darwin"
      ;;
    Darwin:x86_64)
      target="x86_64-apple-darwin"
      ;;
    Linux:aarch64)
      target="aarch64-unknown-linux-gnu"
      ;;
    Linux:x86_64)
      target="x86_64-unknown-linux-gnu"
      ;;
    *)
      print -u2 "zsh-patina: unsupported platform $(uname -s)/$(uname -m)"
      return 1
      ;;
  esac

  local release asset url tmp

  release=$(curl -fsSL \
    "https://api.github.com/repos/$repo/releases/latest") || {
    print -u2 "zsh-patina: unable to query latest release"
    return 1
  }

  asset=$(print -r -- "$release" |
    grep -o '"browser_download_url": "[^"]*"' |
    grep "$target" |
    head -1 |
    sed 's/.*"//;s/"$//')

  if [[ -z "$asset" ]]; then
    print -u2 "zsh-patina: no release found for $target"
    return 1
  fi

  mkdir -p "$bin_dir"

  tmp=$(mktemp -d)

  curl -fsSL "$asset" -o "$tmp/archive" || {
    rm -rf "$tmp"
    return 1
  }

  tar -xzf "$tmp/archive" -C "$tmp" --strip-components=1

  install -m 755 "$tmp/zsh-patina" "$bin"

  rm -rf "$tmp"
fi

if [[ ! -r "$cache" || "$bin" -nt "$cache" ]]; then
  mkdir -p "$cache_dir"
  "$bin" activate >| "$cache"
fi

source "$cache"
