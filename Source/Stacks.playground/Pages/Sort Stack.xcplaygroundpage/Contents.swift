//: [Previous](@previous)
/*:
 # Sort Stack:
 Write a program to sort a stack such that the smallest items are on the top. You can use an additional temporary stack, but you may not copy the elements into any other data structure (such as an array).The stack supports the following operations: push, pop, peek, and isEmpty.
 */
import Foundation

extension Stack where T == Int {
    
    mutating func sort(ascending: Bool = true) {
        
        var tempStack = Stack<Int>()
        let checkSort = { (a: Int, b: Int) -> Bool in
            return ascending ? a < b : a > b
        }
        
        while !self.isEmpty {
            
            let item = self.pop()!
            
            if !tempStack.isEmpty, checkSort(item, tempStack.peek!) {
                while !tempStack.isEmpty {
                    self.push(tempStack.pop()!)
                }
            }
            
            tempStack.push(item)
            
        }
        
        self = tempStack
    }
    
}

var stack = Stack<Int>()
stack.push(6)
stack.push(3)
stack.push(4)
stack.push(0)
stack.push(11)
stack.push(7)
print(stack.describe())
stack.sort(ascending: true)
print(stack.describe())
stack.sort(ascending: false)
print(stack.describe())
//: [Next](@next)
