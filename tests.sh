#!/usr/bin/env bash
set -euo pipefail

root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

run_case() {
    local input="$1"
    local expected="$2"
    local actual
    actual=$(printf '%s' "$input" | "$root/solution.sh")
    [[ "$actual" == "$expected" ]] || {
        printf 'FAIL\nInput:\n%s\nExpected: %s\nActual: %s\n' "$input" "$expected" "$actual" >&2
        exit 1
    }
}

run_case $'5\n5 7 10 5 15\n2 2 1 3 5\n' '8'
run_case $'4\n3 5 8 2\n1 2 1 1\n' '12'
run_case $'2\n5 6\n2 4\n' '-1'
run_case $'3\n7 7 7\n3 3 3\n' '0'

printf 'All Make All Equal tests passed.\n'
