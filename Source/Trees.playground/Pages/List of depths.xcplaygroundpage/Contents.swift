//: [Previous](@previous)
/*:
 # List of Depths
 
 Given a binary tree, design an algorithm which creates a linked list of all the nodes at each depth (e.g., if you have a tree with depth D, you'll have Dlinked lists).
 */
import Foundation

func listOfDepths(root: TreeNode<Int>) -> [LinkedList<TreeNode<Int>>] {
    
    var result = [LinkedList<TreeNode<Int>>]()
    var nodesAtLevel = [TreeNode<Int>]()
    
    nodesAtLevel.append(root)
    
    while !nodesAtLevel.isEmpty {
        
        let list = LinkedList<TreeNode<Int>>()
        var children = [TreeNode<Int>]()
        
        // create linked list
        for node in nodesAtLevel {
            list.append(node)
            children += node.children
        }
        result.append(list)
        
        nodesAtLevel = children
        
    }
    
    return result
}


let root = TreeNode<Int>(value: 10)

let nine = TreeNode<Int>(value: 9)
root.addChild(nine)

let seven = TreeNode<Int>(value: 7)
root.addChild(seven)

let two = TreeNode<Int>(value: 2)
nine.addChild(two)

print(root.description)
print(listOfDepths(root: root))

//: [Next](@next)
