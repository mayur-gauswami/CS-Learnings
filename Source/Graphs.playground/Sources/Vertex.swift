import Foundation

public struct Vertex<T>: Hashable where T: Hashable {
    public let data: T
    public let index: Int
}
