import Foundation

var array = randomArray(length: 10, max: 30)
print(array)
var arrayView = ArrayStackView()

//var isSorted: Bool

let size = array.count

for i in 0..<size {
    let pass = (size - 1) - i
    for j in 0..<pass {
        let key = array[j]
        
        if key > array[j + 1] {
            array.swapAt(j, j + 1)
            arrayView.update(with: array)
        }
    }
}

assert(array == array.sorted())
