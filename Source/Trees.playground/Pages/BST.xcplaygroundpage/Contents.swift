//: [Previous](@previous)
/*:
 # Binary Search Tree
 */
import Foundation

public class BinarySearchTree<T: Comparable> {
    
    fileprivate(set) var value: T
    fileprivate(set) var left: BinarySearchTree<T>?
    fileprivate(set) var right: BinarySearchTree<T>?
    fileprivate(set) var parent: BinarySearchTree<T>?
    
    init(value: T) {
        self.value = value
    }
    
    public func insert(value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                left = BinarySearchTree<T>(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree<T>(value: value)
                right?.parent = self
            }
        }
    }
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = "\(value)"
        let children = [left, right]
        if !children.isEmpty {
            s += " {" + "L: \(left?.description ?? "NULL"), " + "R: \(right?.description ?? "NULL")" + "}"
        }
        return s
    }
}

let one = BinarySearchTree<Int>(value: 1)
one.insert(value: 2)
one.insert(value: 3)
print(one)
//: [Next](@next)
