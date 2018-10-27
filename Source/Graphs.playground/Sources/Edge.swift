import Foundation

public struct Edge<T>: Hashable where T: Hashable {
    public let from: Vertex<T>
    public let to: Vertex<T>
    public let weight: Double?
}
