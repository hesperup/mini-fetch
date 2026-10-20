#!/bin/sh
# mini-fetch installer
set -e

prefix="${PREFIX:-$HOME/.local}"
bindir="$prefix/bin"

install -d "$bindir"
install -m 755 fetch "$bindir/fetch"

echo "installed mini-fetch to $bindir/fetch"
case ":$PATH:" in
    *":$bindir:"*) ;;
    *) echo "note: $bindir is not in your PATH" ;;
esac
