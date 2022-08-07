import Foundation

var array = randomArray(length: 10, max: 30)
print(array)
var arrayView = ArrayStackView()

var isSorted: Bool

repeat {
    isSorted = true
    
    for i in 0..<array.count - 1 {
        if array[i] > array[i + 1] {
            array.swapAt(i, i + 1)
            arrayView.update(with: array)
            isSorted = false
        }
    }
} while (!isSorted)

assert(array == array.sorted())
