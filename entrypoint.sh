#!/bin/bash

set -e

port="5432"
host="$1"
shift
cmd="$@"

until echo "" > /dev/tcp/$host/$port; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec $cmd