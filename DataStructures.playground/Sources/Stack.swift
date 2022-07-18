public struct Stack<Element: Equatable>: Equatable {
    private var storage: [Element] = []
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    @discardableResult
    public func peek() -> Element? {
        storage.last
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        storage.map { "\($0)" }.joined(separator: " ")
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
