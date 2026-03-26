#!/bin/sh

set -eu

IGNORE=(".DS_Store" ".git" ".gitignore" ".win" "install.sh" "install.ps1" "README.md")
HERE="$(cd "$(dirname "$0")" && pwd)"
HOME_DIR="$HOME"

log() {
    echo "$1"
}

is_ignored() {
    local name="$1"
    for i in "${IGNORE[@]}"; do
        [[ "$i" == "$name" ]] && return 0
    done
    return 1
}

link_file() {
    local target="$1"
    local link="$2"

    if [ -L "$link" ]; then
        log "### Warning: $link already linked"
    elif [ -e "$link" ]; then
        log "### $link exists (skip)"
    else
        ln -s "$target" "$link"
        log "ln -s $target $link"
    fi
}

find "$HERE" -type f | while read -r file; do
    rel="${file#$HERE/}"
    name="$(basename "$file")"
    top="${rel%%/*}"

    if is_ignored "$name" || is_ignored "$top"; then
        log "## ignored: $rel"
        continue
    fi

    link_dir="$HOME_DIR/$(dirname "$rel")"
    link_path="$HOME_DIR/$rel"

    if [ ! -d "$link_dir" ]; then
        log "mkdir -p $link_dir"
        mkdir -p "$link_dir"
    fi

    link_file "$file" "$link_path"
done
