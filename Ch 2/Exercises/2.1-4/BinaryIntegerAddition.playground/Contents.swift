/*
 2.1-4
 Consider the problem of adding two n-bit binary integers, stored in two n-element arrays A and B. The sum of the two integers should be stored in binary form in an (n+1)-element array C. State the problem formally and write pseudocode for adding the two integers.
 */


func binaryAddition(a:[Int], b:[Int]) -> [Int]? {
    var c = Array(repeating: 0, count: b.count)
    var carryOver = 0
    for (i, _) in c.enumerated().reversed() {
        guard let (result, carry) = addBits(a[i], b[i], carry: carryOver) else {
            return nil
        }
        c[i] = result
        carryOver = carry
    }
    c.insert(carryOver, at: 0)
    return c
}

func addBits(_ first: Int, _ second: Int, carry: Int) -> (result:Int, carry:Int)? {
    let sum = first + second + carry
    switch (sum) {
    case (0):
        return (0, 0)
    case (1):
        return (result: 1, carry: 0)
    case (2):
        return (result: 0, carry: 1)
    case (3):
        return (result: 1, carry: 1)
    default:
        return nil
    }
}

// Tests

// Empty arrays
var a = [Int]()
var b = [Int]()
binaryAddition(a: a, b: b)

// Not binary arrays
a = [4, 2, 6, 3, 6]
b = [7, 4, 6, 3, 7]
binaryAddition(a: a, b: b)

// Size 1
a = [0]
b = [0]
binaryAddition(a: a, b: b)

a = [0]
b = [1]
binaryAddition(a: a, b: b)

a = [1]
b = [0]
binaryAddition(a: a, b: b)

a = [1]
b = [1]
binaryAddition(a: a, b: b)

// Arbitrary sums
a = [1, 1, 0, 1, 0]
b = [1, 0, 0, 0, 1]
binaryAddition(a: a, b: b)

a = [1, 1, 1, 1, 1]
b = [1, 1, 1, 1, 1]
binaryAddition(a: a, b: b)