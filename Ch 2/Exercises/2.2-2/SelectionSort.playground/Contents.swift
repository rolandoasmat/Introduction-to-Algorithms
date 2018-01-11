/*
 2.2-2
 Consider sorting n numbers stored in an array A by first finding the smallest element of A and exchanging it with the element in A[1]. Then find the second smallest element of A, and exchange it with A[2]. Continue in this manner for the first n-1 elements of A. Write pseudocode for this algorithm, which is knows as selection sort.
 */

func selectionSort<T: Comparable>(a: [T]) -> [T] {
    var a = a
    guard a.first != nil else {
        return a
    }
    for(i, value) in a.enumerated() {
        var smallestValueIndex = i
        // find smallest after i
        for j in i..<a.count {
            if a[j] < a[smallestValueIndex] {
                smallestValueIndex = j
            }
        }
        // swap
        let temp = a[i]
        a[i] = a[smallestValueIndex]
        a[smallestValueIndex] = temp
    }
   return a
}

// Tests

// Empty array
var x = [Int]()
selectionSort(a: x)

// Size 1
x = [34]
selectionSort(a: x)

// Already in order
x = [294, 58, 58, 40, 34, 29]
selectionSort(a: x)

// Opposite order
x = [29, 34, 40, 58, 58, 294]
selectionSort(a: x)

// Random order
x = [34, 40, 58, 294, 29, 58]
selectionSort(a: x)
