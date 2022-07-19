protocol Queue {
    associatedtype Element
    
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

// Queue Array
public struct QueueArray<T>: Queue {
    private var array: [T] = []
    
    public init() { }
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public var peek: T? {
        array.first
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

// Queue Stack
public struct QueueStack<T: Equatable>: Queue {
    private var enqueueStack: [T] = []
    private var dequeueStack: [T] = []

    public init() { }

    public var isEmpty: Bool {
        dequeueStack.isEmpty && enqueueStack.isEmpty
    }
    
    public var peek: T? {
        !dequeueStack.isEmpty ? dequeueStack.last : enqueueStack.first
    }
    
    public mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
    }
    
    @discardableResult
    public mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        
        return dequeueStack.popLast()
    }
}
