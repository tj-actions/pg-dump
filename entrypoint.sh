#!/usr/bin/env bash

set -euo pipefail

echo "::group::pg-dump"

echo "Creating the output directory..."

mkdir -p "$(dirname "$INPUT_PATH")"

echo "Created the output directory"

echo "Running pg_dump..."

# shellcheck disable=SC2086
pg_dump $INPUT_OPTIONS -d "$INPUT_DATABASE_URL" > "$INPUT_PATH"

echo "Complete"

echo "::endgroup::"