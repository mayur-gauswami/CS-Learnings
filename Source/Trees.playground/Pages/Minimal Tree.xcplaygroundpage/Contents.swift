//: [Previous](@previous)
/*:
 # Minimal tree
 
 Given a sorted (increasing order) array with unique integer elements, write an algorithm to create a binary search tree with minimal height.
 */
import Foundation

func createMinimalTree(from list: Array<Int>) -> TreeNode<Int>? {
    return createMinimalBST(list: list, start: 0, end: list.count - 1)
}

func createMinimalBST(list: Array<Int>, start: Int, end: Int) -> TreeNode<Int>? {
    if end < start {
        return nil
    }
    
    let mid = (start + end) / 2
    let node = TreeNode<Int>(value: list[mid])
    let left = createMinimalBST(list: list, start: start, end: mid - 1)
    left.map{ node.addChild($0) }
    let right = createMinimalBST(list: list, start: mid + 1, end: end)
    right.map{ node.addChild($0) }
    return node
}

let minimalBST = createMinimalTree(from: [1,2,3,4,5,6,7,8,9])
print(minimalBST?.description ?? "")
//: [Next](@next)
