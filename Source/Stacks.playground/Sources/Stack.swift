import Foundation

public struct Stack<T> {
    
    fileprivate var array: [T] = []
    
    public init() {
        
    }
    
    public var count: Int {
        return array.count
    }
    
    public var peek: T? {
        return array.last
    }
    
    public var isEmpty: Bool {
        return array.count == 0
    }
    
    public mutating func push(_ item: T) {
        array.append(item)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public mutating func removeBottom() -> T? {
        return array.count > 0 ? array.remove(at: 0) : nil
    }
    
    public func describe() -> String {
        return "\(array)"
    }
    
}
