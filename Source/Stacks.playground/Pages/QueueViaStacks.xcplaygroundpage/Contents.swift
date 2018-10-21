//: [Previous](@previous)
/*:
 # Queue via Stacks:
 
 Implement a MyQueue class which implements a queue using two stacks.
 */

import Foundation


struct QueueofStacks<T> {
    
    private var oldStack: Stack<T> = Stack<T>()
    
    private var newStack: Stack<T> = Stack<T>()
    
    var count: Int {
        return newStack.count + oldStack.count
    }
    
    mutating func peek() -> T? {
        transferNewStackToOld()
        return oldStack.peek
    }
    
    mutating func add(_ item: T) {
        newStack.push(item)
    }
    
    mutating func remove() -> T? {
        transferNewStackToOld()
        return oldStack.pop()
    }
    
    func describe() -> String {
        return "old: \(oldStack.describe()), new: \(newStack.describe())"
    }
    
    private mutating func transferNewStackToOld() {
        if oldStack.isEmpty {
            while !newStack.isEmpty {
                if let item = newStack.pop() {
                    oldStack.push(item)
                }
            }
        }
    }
    
}

var queue = QueueofStacks<Int>()
queue.add(1)
queue.add(2)
queue.add(3)
print(queue.describe())
queue.remove()
print(queue.describe())
queue.add(4)
print(queue.describe())
queue.remove()
print(queue.describe())
queue.remove()
print(queue.describe())
queue.add(5)
print(queue.describe())
queue.remove()
print(queue.describe())
//: [Next](@next)
