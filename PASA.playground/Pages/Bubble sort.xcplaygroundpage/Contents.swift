import Foundation

var array = randomArray(length: 30, max: 50)
print(array)
var arrayView = ArrayStackView()

func bubbleSort(array: inout [Int]) -> [Int] {
    
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
    
    return array
}

bubbleSort(array: &array)

assert(array == array.sorted())
