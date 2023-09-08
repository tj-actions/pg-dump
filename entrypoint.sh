#!/usr/bin/env bash

set -euo pipefail

echo "::group::pg-dump"

echo "Creating the output directory..."

mkdir -p "$(dirname "$INPUT_PATH")"

echo "Created the output directory"

if [[ -n "$INPUT_POSTGRESQL_VERSION" ]]; then
    echo "Verifying version"

    # Check if the input is an integer
    if ! [[ "$INPUT_POSTGRESQL_VERSION" =~ ^[0-9]+$ ]]; then
        echo "Error: $INPUT_POSTGRESQL_VERSION is not a valid integer."
        exit 1
    fi

    # Check if the input is between 10 and 15 (inclusive)
    if (( INPUT_POSTGRESQL_VERSION < 10 || INPUT_POSTGRESQL_VERSION > 15 )); then
        echo "Error: $INPUT_POSTGRESQL_VERSION is not between 10 and 15 (inclusive)."
        exit 1
    fi

    echo "Validated postgresql version: $INPUT_POSTGRESQL_VERSION"

    echo "Installing postgresql..."

    if [[ "$(uname -s)" == "Linux" ]]; then
        sudo apt-get update
        sudo apt-get install -y "postgresql-$INPUT_POSTGRESQL_VERSION"
    elif [[ "$(uname -s)" == "NT"* ]]; then
        choco install postgresql --version="$INPUT_POSTGRESQL_VERSION" -y
    elif [[ "$(uname -s)" == "Darwin" ]]; then
        brew update
        brew install "postgresql@$INPUT_POSTGRESQL_VERSION"
    else
        echo "Unsupported OS"
        exit 1
    fi

    if [[ "$(uname -s)" == "NT"* ]]; then
        echo "/Program Files/PostgreSQL/15/bin" >> "$GITHUB_PATH"
    else
        echo "/usr/lib/postgresql/15/bin" >> "$GITHUB_PATH"
    fi

    echo "Installed postgresql"
fi

echo "Running pg_dump..."

# shellcheck disable=SC2086
pg_dump $INPUT_OPTIONS -d "$INPUT_DATABASE_URL" > "$INPUT_PATH"

echo "Complete"

echo "::endgroup::"
