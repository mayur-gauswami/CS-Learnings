//: [Previous](@previous)
/*:
 # SetOfStacks
 Imagine a (literal) stack of plates. If the stack gets too high, it might topple. Therefore, in real life, we would likely start a new stack when the previous stack exceeds some threshold. Implement a data structure SetOfStacks that mimics this. SetOfStacks should be composed of several stacks and should create a new stack once the previous one exceeds capacity. SetOfStacks. push () and SetOfStacks. pop () should behave identically to a single stack (that is, pop ( ) should return the same values as it would if there were just a single stack).
 
 FOLLOW UP:
 Implement a function popAt(int index) which performs a pop operation on a specific sub-stack.
 */
import Foundation

struct SetOfStacks<T> {
    
    private var stacks: [Stack<T>] = []
    
    private let capacity: Int
    
    private var lastStack: Stack<T>? {
        return stacks.last
    }
    
    private var lastStackIndex: Int {
        return stacks.count - 1
    }
    
    init(capacity: Int) {
        self.capacity = capacity
    }
    
    mutating func push(item: T) {
        var stack = lastStack
        let needNewStack = stack == nil || stack?.count == capacity
        stack = needNewStack ? Stack<T>() : stack
        
        stack?.push(item)
        
        // update stacks
        if needNewStack {
            stacks.append(stack!)
        } else {
            update(stack: stack!, at: lastStackIndex)
        }
    }
    
    mutating func pop() -> T? {
        if var stack = lastStack {
            let item = stack.pop()
            update(stack: stack, at: lastStackIndex)
            return item
        }
        return nil
    }
    
    mutating func pop(at index: Int) -> T? {
        return leftShift(at: index, removeFromTop: true)
    }
    
    private mutating func leftShift(at index: Int, removeFromTop: Bool) -> T? {
        
        guard index < stacks.count else {
            return nil
        }
        
        var item: T?
        var stack = stacks[index]
        
        if removeFromTop {
            item = stack.pop()
        } else {
            item = stack.removeBottom()
        }
        
        if stacks.count > index + 1 {
            if let shiftedItem = leftShift(at: index + 1, removeFromTop: false) {
                stack.push(shiftedItem)
            }
        }
        
        update(stack: stack, at: index)
        
        return item
    }
    
    private mutating func update(stack: Stack<T>, at index: Int) {
        if stack.isEmpty {
            stacks.remove(at: index)
        } else if index < stacks.count {
            stacks[index] = stack
        }
    }
    
    func decribe() -> String {
        var result: [String] = []
        for stack in stacks {
            result.append(stack.describe())
        }
        return result.joined(separator: ", ")
    }
    
}

var stack = SetOfStacks<Int>.init(capacity: 3)
stack.push(item: 1)
stack.push(item: 2)
stack.push(item: 3)
stack.push(item: 4)
stack.push(item: 5)
stack.push(item: 6)
stack.push(item: 7)
stack.push(item: 8)
stack.push(item: 9)
print(stack.decribe())
stack.pop(at: 1)
print(stack.decribe())
stack.pop(at: 1)
print(stack.decribe())
stack.pop()
print(stack.decribe())
stack.pop(at: 1)
print(stack.decribe())
//: [Next](@next)
