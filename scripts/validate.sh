#!/usr/bin/env bash
set -euo pipefail

echo "Validating YAML files..."
find table_groups -type f -name "*.yaml" -print0 | xargs -0 yq -e 'true'

echo "Running TestGen dry run..."
dk tg validate --conn env/snowflake.conn.yaml --all

echo "Validation successful!"
