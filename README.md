# Make All Equal

## Problem

Given arrays `A` and `B` of equal length, one operation chooses an index `i` and changes `A[i]` to `A[i] - B[i]`, provided the operation is allowed. The goal is to make every value in `A` equal using the minimum number of operations. If this cannot be done, print `-1`.

## Key Observation

All values can only decrease, so the final common value `x` must satisfy `0 ≤ x ≤ min(A)`. For a fixed index `i`, reaching `x` requires:

```text
A[i] - k × B[i] = x
```

for some non-negative integer `k`. This is possible exactly when `A[i] - x` is divisible by `B[i]`, or equivalently:

```text
A[i] % B[i] = x % B[i]
```

When the target is reachable, the required number of operations at index `i` is `(A[i] - x) / B[i]`.

## Algorithm

1. Compute `min(A)`.
2. Try every possible target from `min(A)` down to `0`.
3. For each target, verify the modular condition for every index.
4. If the target is reachable for all indices, sum the operation counts and print the result.
5. If no target is feasible, print `-1`.

Targets are tested from largest to smallest. A larger feasible target always requires no more operations than a smaller feasible target, so the first feasible target is optimal.

## Correctness

For each candidate target `x`, the modular test is necessary and sufficient for every `A[i]` to reach `x` through repeated subtraction of `B[i]`. The algorithm sums the exact number of subtractions required for that target. Since all possible final values are considered in descending order, the first feasible target is the largest feasible value and therefore minimizes the total number of operations.

## Complexity

Let `M = min(A)` and `N` be the array length.

| Measure | Complexity |
|---|---:|
| Time | `O(N × M)` |
| Extra space | `O(1)` |

The input arrays themselves require `O(N)` storage.

## Implementation

The solution is implemented in GNU Bash 5.0.17 in [`solution.sh`](solution.sh).
