#!/usr/bin/env bash

set -euo pipefail

socketdir=$(mktemp -d)

if [[ $# -lt 2 ]]; then
    echo "usage: $0 DATADIR COMMAND [ARGS]" >&2
    exit 1
fi

datadir=$1
shift

pg_ctl start -D "$datadir" -w -o "-h '' -k $socketdir" >&2
shutdown() {
    echo "Shutting down" >&2
    pg_ctl stop -D "$datadir" >&2
    rm -rf "$socketdir"
}
trap shutdown EXIT
PGHOST=$socketdir "$@"
# nix-shell -p postgresql_9_6 --run "./with-temp-postgres /usr/local/var/postgres-9.6 psql -l"
# https://github.com/purcell/with-temp-postgres
