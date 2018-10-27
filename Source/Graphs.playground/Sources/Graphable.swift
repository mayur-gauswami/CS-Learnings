import Foundation

public enum EdgeType {
    case directed, undirected
}

public protocol Graphable {
    associatedtype Element: Hashable
    
    var vertices: [Vertex<Element>] { get }
    var edges: [Edge<Element>] { get }
    var description: CustomStringConvertible { get }
    
    func createVertex(_ data: Element) -> Vertex<Element>
    func addEdge(type: EdgeType,_ from: Vertex<Element>, to: Vertex<Element>, weight: Double?)
    func weightFrom(_ sourceVertex: Vertex<Element>, to destinationVertex: Vertex<Element>) -> Double?
    func edgesFrom(_ sourceVertex: Vertex<Element>) -> [Edge<Element>]
}
