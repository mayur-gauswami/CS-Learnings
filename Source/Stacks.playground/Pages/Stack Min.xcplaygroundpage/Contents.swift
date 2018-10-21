//: [Previous](@previous)

/*:
 
 # Stack Min
 
 How would you design a stack which, in addition to push and pop, has a function min which returns the minimum element? Push, pop and min should all operate in 0(1) time.
 
 */

import Foundation

struct StackMin {
    
    private var array: [Int] = []
    
    private var _min: Int?
    
    var count: Int {
        return array.count
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var min: Int? {
        return _min
    }
    
    mutating func push(_ item: Int) {
        
        var x = item
        if _min == nil {
            _min = item
        } else if let min = _min, item < min {
            x = 2 * item - min
            self._min = item
        }
        
        array.append(x)
    }
    
    mutating func pop() -> Int? {
        var x = array.popLast()
        
        if let min = _min, let item = x, item < min {
            x = min
            _min = 2 * min - item
        }
        
        return x
    }
    
    func describe() {
        print("\(array) | min: \(_min ?? -1)")
    }
    
}

var stack = StackMin()
stack.push(4)
stack.describe()
stack.push(9)
stack.push(3)
stack.push(-1)
stack.push(1)
stack.push(1)
stack.describe()
stack.pop()
stack.describe()
stack.pop()
stack.describe()
stack.pop()
stack.describe()
//: [Next](@next)
