/*
 2.3-2
 Rewrite the Merge procedure so that it does not use sentinels, instead stopping once either array L or R has had all its elements copied back to A and then copying the remainder of the other array back into A.
 */

func mergeSort<T:Comparable>(array:[T]) -> [T] {
    if array.count < 2 {
        return array
    } else if array.count == 2 {
        let left = [array[0]]
        let right = [array[1]]
        return merge(a: left, b: right)
    } else {
        let i = 0
        let j = array.count-1
        let mid = (i + j)/2
        let left = mergeSort(array: Array(array[i...mid]))
        let right = mergeSort(array: Array(array[mid+1...j]))
        return merge(a: left, b: right)
    }
}

func merge<T:Comparable>(a: [T], b: [T]) -> [T] {
    var i = 0
    var j = 0
    var c = [T]()
    while(i < a.count && j < b.count) {
        if a[i] <= b[j] {
            c.append(a[i])
            i += 1
        } else if b[j] < a[i] {
            c.append(b[j])
            j += 1
        }
    }
    // Move remaining elements
    if i >= a.count {
        c.append(contentsOf: b[j...b.count-1])
    } else if j >= b.count {
        c.append(contentsOf: a[i...a.count-1])
    }
    return c
}

// Tests

// Even count
var array = [5, 78, 12, 63, 78, 56, 12, 33]
mergeSort(array: array)

// Odd count
array = [5, 78, 12, 63, 78, 56, 12]
mergeSort(array: array)

// Empty
array = []
mergeSort(array: array)

// Opposite order
array = [85, 79, 62, 56, 48, 37, 22, 16]
mergeSort(array: array)

// Negative numbers
array = [5, 78, -12, 63, -78, -56, 12, -33]
mergeSort(array: array)

// Some zeros
array = [5, 78, 0, 63, 0, -56, 0, -33]
mergeSort(array: array)