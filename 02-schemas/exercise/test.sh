#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

git diff --no-index <(pkl eval -f json "$SCRIPT_DIR/mySystem.pkl") "$SCRIPT_DIR/mySystem.json"
