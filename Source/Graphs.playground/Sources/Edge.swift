import Foundation

public struct Edge<T>: Hashable where T: Hashable {
    public let from: Vertex<T>
    public let to: Vertex<T>
    public let weight: Double?
}

extension Edge: CustomStringConvertible {
    public var description: String {
        var result = "\(from) -> \(to)"
        weight.map{ result += " (\($0))" }
        return result
    }
}
