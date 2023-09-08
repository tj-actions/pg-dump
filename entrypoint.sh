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
        # Create the file repository configuration:
        sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
        
        # Import the repository signing key:
        wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
        
        # Update the package lists:
        sudo apt-get update

        # Install PostgreSQL
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

    echo "Installed postgresql"

    echo "Running pg_dump..."
    
    # Verify installation by running pg_dump directly
    if [[ "$(uname -s)" == "NT"* ]]; then
        "/Program Files/PostgreSQL/15/bin/pg_dump" --version
        # shellcheck disable=SC2086
        "/Program Files/PostgreSQL/15/bin/pg_dump" $INPUT_OPTIONS -d "$INPUT_DATABASE_URL" > "$INPUT_PATH"
    else
        "/usr/lib/postgresql/15/bin/pg_dump" --version
        # shellcheck disable=SC2086
        "/usr/lib/postgresql/15/bin/pg_dump" $INPUT_OPTIONS -d "$INPUT_DATABASE_URL" > "$INPUT_PATH"
    fi
else
    echo "Running pg_dump..."

    # shellcheck disable=SC2086
    pg_dump $INPUT_OPTIONS -d "$INPUT_DATABASE_URL" > "$INPUT_PATH"
fi

echo "Complete"

echo "::endgroup::"
