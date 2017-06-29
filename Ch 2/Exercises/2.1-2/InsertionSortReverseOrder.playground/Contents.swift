/*
 2.1-2
 Rewrite the INSERTION-SORT procedure to sort into nonincreasing instead of nondecreasing order.
 
 p.s. not sure why the book wouldn't just call it decreasing and increasing >:O nerds
 */

func insertionSortReversed(array: [Int]) -> [Int] {
    if(array.count == 0) { return array }
    var array = array
    for i in 1..<array.count {
        var j = i
        let value = array[i]
        while(j>0 && value > array[j-1]) {
            array.swapValuesAtIndecis(j, and: j-1)
            j = j-1
        }
    }
    return array
}

extension Array {
    mutating func swapValuesAtIndecis(_ i: Int, and j: Int) {
        let temp = self[i]
        self[i] = self[j]
        self[j] = temp
    }
}

// Tests

// Empty array
var x = [Int]()
insertionSortReversed(array: x)

// Size 1
x = [34]
insertionSortReversed(array: x)

// Already in order
x = [294, 58, 58, 40, 34, 29]
insertionSortReversed(array: x)

// Opposite order
x = [29, 34, 40, 58, 58, 294]
insertionSortReversed(array: x)

// Random order
x = [34, 40, 58, 294, 29, 58]
insertionSortReversed(array: x)
