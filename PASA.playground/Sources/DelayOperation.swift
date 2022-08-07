import Foundation

open class DelayOperation: Operation {
    private var _executing = false
    private var _finished = false
    private let delayInSeconds: TimeInterval
    
    public init(delayInSeconds: TimeInterval) {
        self.delayInSeconds = delayInSeconds
        super.init()
    }
    
    open override func cancel() {
        super.cancel()
        finish()
    }
    
    open override func start() {
        guard !isCancelled else {
            finish()
            return
        }
        willChangeValue(forKey: "isExecuting")
        _executing = true
        didChangeValue(forKey: "isExecuting")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds) { [weak self] in
            if self?.isCancelled == false {
                self?.finish()
            }
        }
    }
    
    open override var isExecuting: Bool {
        return _executing
    }
    
    open override var isFinished: Bool {
        return _finished
    }
    
    func finish() {
        willChangeValue(forKey: "isExecuting")
        willChangeValue(forKey: "isFinished")
        _executing = false
        _finished = true
        didChangeValue(forKey: "isExecuting")
        didChangeValue(forKey: "isFinished")
    }
}
