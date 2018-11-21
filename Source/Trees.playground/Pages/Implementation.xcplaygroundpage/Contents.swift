//: [Previous](@previous)
/*:
 ## Tree
 */
let root = TreeNode<Int>(value: 10)

let nine = TreeNode<Int>(value: 9)
root.addChild(nine)

let seven = TreeNode<Int>(value: 7)
root.addChild(seven)

let two = TreeNode<Int>(value: 2)
nine.addChild(two)

print(root)

