import Foundation

public struct Queue<T> {
    
    private var queue = LinkedList<T>()
    
    public init() {}
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ item: T) {
        queue.append(item)
    }
    
    public mutating func dequeue() -> T? {
        return queue.removeFirst()
    }
    
}
