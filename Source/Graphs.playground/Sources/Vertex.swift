import Foundation

public struct Vertex<T>: Hashable where T: Hashable {
    public let data: T
    public let index: Int
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}
