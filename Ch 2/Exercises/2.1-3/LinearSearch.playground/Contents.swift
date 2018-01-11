/*
 2.1-3
 Consider the searching problem:
 Input: A sequence of n numbers A = { a1, a2, ..., an} and a value v.
 Output: An index i such that v = A[i] or the sepcial value NIL if v does not appear in A.
 Write pseudocode for linear search, which scans through the sequence, looking for v.
 */

func linearSearch<T: Equatable>(array:[T], v: T) -> Int? {
    for (i, value) in array.enumerated() {
        if value == v {
            return i
        }
    }
    return nil
}

// Tests

// Empty array
var x = [Int]()
linearSearch(array: x, v: 1)

// Duplicates array
x = [1, 1, 1, 1]
linearSearch(array: x, v: 1)

// Exists, at head
x = [45, 25, 96, 78, 82, 42, 89]
linearSearch(array: x, v: 45)

// Exists, at tail
linearSearch(array: x, v: 89)

// Exists, arbitrary
linearSearch(array: x, v: 78)

// Does NOT exist
linearSearch(array: x, v: -1)