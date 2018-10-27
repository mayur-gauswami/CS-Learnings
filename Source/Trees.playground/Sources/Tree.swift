import Foundation

public class TreeNode<T> {
    
    public let value: T
    public var children: [TreeNode<T>] = []
    public var parent: TreeNode<T>?
    
    public init(value: T) {
        self.value = value
    }
    
    public func addChild(_ node: TreeNode<T>) {
        children.append(node)
        node.parent = self
    }
    
}

extension TreeNode: CustomStringConvertible {
    
    public var description: String {
        var s = "\(value)"
        if !children.isEmpty {
            s += " {" + children.map { $0.description }.joined(separator: ", ") + "}"
        }
        return s
    }
    
}
