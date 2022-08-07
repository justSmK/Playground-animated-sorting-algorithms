import Foundation

var array = randomArray(length: 30, max: 50)
print(array)
var arrayView = ArrayStackView()

func countingSort(array: inout [Int]) -> [Int] {
    let maxVal = array.max()!
    let m = maxVal + 1
    
    var container = Array(repeating: 0, count: m)
    
    for j in array {
        container[j] += 1
    }
    
    var i = 0
    
    for a in 0..<m {
        for _ in 0..<container[a] {
            array[i] = a
            i += 1
            arrayView.update(with: array)
        }
    }
    return array
}

countingSort(array: &array)

assert(array == array.sorted())
