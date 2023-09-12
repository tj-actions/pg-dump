#!/usr/bin/env bash

set -euo pipefail

echo "::group::pg-dump"

echo "Checking if the output directory exists..."

if [ ! -d "$(dirname "$INPUT_PATH")" ]; then
    echo "The output directory does not exist. Creating it..."
    mkdir -p "$(dirname "$INPUT_PATH")"
    echo "Created the output directory"
else
    echo "The output directory already exists"
fi

echo "Running pg_dump..."

# shellcheck disable=SC2086
pg_dump $INPUT_OPTIONS -d "$INPUT_DATABASE_URL" > "$INPUT_PATH"

echo "Complete"

echo "::endgroup::"
