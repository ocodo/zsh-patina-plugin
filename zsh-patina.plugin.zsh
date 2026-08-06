# zsh-patina.plugin.zsh
#
# Zsh integration wrapper for zsh-patina
# https://github.com/michel-kraemer/zsh-patina

local repo="michel-kraemer/zsh-patina"
local bin_dir=${XDG_BIN_HOME:-$HOME/.local/bin}
local bin="$bin_dir/zsh-patina"
local cache_dir=${XDG_CACHE_HOME:-$HOME/.cache}/zsh-patina
local cache="$cache_dir/init.zsh"
local completion_dir="$cache_dir/completions"
local completion_file="$completion_dir/_zsh-patina"

if (( $+commands[zsh-patina] )); then
  bin=${commands[zsh-patina]}
fi

if [[ ! -x "$bin" ]]; then
  if ! (( $+commands[curl] && $+commands[tar] )); then
    print -u2 "zsh-patina: requires curl and tar for bootstrap"
    return 1
  fi

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
      print -u2 "zsh-patina: unsupported platform: $(uname -s)/$(uname -m)"
      return 1
      ;;
  esac

  local release asset_url tmp

  release=$(curl -fsSL \
    "https://api.github.com/repos/$repo/releases/latest") || {
    print -u2 "zsh-patina: unable to query latest release"
    return 1
  }

  asset_url=$(
    print -r -- "$release" |
    grep -o '"browser_download_url": "[^"]*"' |
    sed 's/.*"browser_download_url": "//;s/"$//' |
    grep -E "${target}\.tar\.gz$" |
    head -1
  )

  if [[ -z "$asset_url" ]]; then
    print -u2 "zsh-patina: no release asset found for $target"
    return 1
  fi

  mkdir -p "$bin_dir"

  tmp=$(mktemp -d) || return 1

  curl -fsSL "$asset_url" -o "$tmp/archive" || {
    rm -rf "$tmp"
    return 1
  }

  tar -xzf "$tmp/archive" -C "$tmp" --strip-components=1 || {
    rm -rf "$tmp"
    return 1
  }

  if [[ ! -x "$tmp/zsh-patina" ]]; then
    print -u2 "zsh-patina: binary missing from archive"
    rm -rf "$tmp"
    return 1
  fi

  install -m 755 "$tmp/zsh-patina" "$bin" || {
    rm -rf "$tmp"
    return 1
  }

  rm -rf "$tmp"
fi

if [[ ! -r "$cache" || "$bin" -nt "$cache" ]]; then
  mkdir -p "$cache_dir"
  chmod 700 "$cache_dir"
  "$bin" activate >| "$cache"
fi

source "$cache"

# zsh-patina completion support
#
# Generated completion is kept separate from plugin-managed files.
# compinit/compaudit remain the responsibility of the plugin manager/user.

mkdir -p "$completion_dir"
chmod 700 "$completion_dir"

if [[ ! -r "$completion_file" || "$bin" -nt "$completion_file" ]]; then
  "$bin" completion --output-file "$completion_file" || {
    print -u2 "zsh-patina: failed to generate completion"
    return 1
  }

  chmod 644 "$completion_file"
fi

fpath=("$completion_dir" $fpath)
