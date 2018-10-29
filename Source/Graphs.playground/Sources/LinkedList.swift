import Foundation

public class LinkedList<T> {
    
    public class Node<T> {
        public let value: T
        public var next: Node<T>?
        
        public init(value: T, next: Node<T>? = nil) {
            self.value = value
            self.next = next
        }
    }
    
    var head: Node<T>?
    
    var last: Node<T>? {
        guard var node = head else { return nil }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    
    public var peek: T? {
        return head?.value
    }
    
    public var count: Int {
        guard var node = head else { return 0 }
        
        var count: Int = 1
        while let next = node.next {
            count += 1
            node = next
        }
        return count
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public init() {}
    
    public func append(_ item: T) {
        let newNode = Node<T>.init(value: item)
        if let lastNode = last {
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    public func removeFirst() -> T? {
        let first = head
        head = head?.next
        return first?.value
    }
    
}
