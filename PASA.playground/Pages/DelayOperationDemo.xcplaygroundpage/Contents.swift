// Add a delay between two Operations.

import Foundation
import PlaygroundSupport

// Allow threading on this playground
PlaygroundPage.current.needsIndefiniteExecution = true

let queue = OperationQueue()
queue.maxConcurrentOperationCount = 1

queue.addOperation {
    print("Operation One")
}

queue.addOperation(
    DelayOperation(2)
)

queue.addOperation {
    print("Operation Two")
}
