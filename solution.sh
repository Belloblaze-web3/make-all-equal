#!/usr/bin/env bash

read -r n
read -r -a a
read -r -a b

min_a=${a[0]}
for ((i = 1; i < n; i++)); do
    if (( a[i] < min_a )); then
        min_a=${a[i]}
    fi
done

for ((target = min_a; target >= 0; target--)); do
    possible=1
    operations=0

    for ((i = 0; i < n; i++)); do
        if (( a[i] % b[i] != target % b[i] )); then
            possible=0
            break
        fi
        operations=$((operations + (a[i] - target) / b[i]))
    done

    if (( possible == 1 )); then
        printf '%d\n' "$operations"
        exit 0
    fi
done

printf '%d\n' -1
