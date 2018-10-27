import Foundation

open class EdgeList<T> where T: Hashable {
    let vertex: Vertex<T>
    var edges: [Edge<T>] = []
    
    init(vertex: Vertex<T>) {
        self.vertex = vertex
    }
    
    func addEdge(_ edge: Edge<T>) {
        edges.append(edge)
    }
}

public class AdjacencyListGraph<T> where T: Hashable {
    
    private var adjacencyList: [EdgeList<T>] = []
    
    public init() {}
    
    func addDirectEdge( _ from: Vertex<T>, to: Vertex<T>, weight: Double?) {
        guard from.index < adjacencyList.count else { return }
        
        let edge = Edge<T>.init(from: from, to: to, weight: weight)
        adjacencyList[from.index].addEdge(edge)
    }
    
    func addUnDirectEdge( vertices: (Vertex<T>, Vertex<T>), weight: Double?) {
        let (source, destination) = vertices
        
        guard source.index < adjacencyList.count, destination.index < adjacencyList.count else { return }
        
        addDirectEdge(source, to: destination, weight: weight)
        addDirectEdge(destination, to: source, weight: weight)
    }
    
}

extension AdjacencyListGraph: Graphable {
    
    public typealias Element = T
    
    public var vertices: [Vertex<AdjacencyListGraph<T>.Element>] {
        return adjacencyList.map{ $0.vertex }
    }
    
    public var edges: [Edge<T>] {
        var allEdges = Set<Edge<T>>()
        
        for list in adjacencyList {
            for edge in list.edges {
                allEdges.insert(edge)
            }
        }
        
        return Array(allEdges)
    }
    
    public var description: CustomStringConvertible {
        var rows: [String] = []
        
        for list in adjacencyList where list.edges.count > 0 {
            var row: [String] = []
            for edge in list.edges {
                var value = "\(edge.to.data)"
                edge.weight.map{ value += " (\($0))" }
                row.append(value)
            }
            rows.append("\(list.vertex.data) -> \(row.joined(separator: ","))")
        }
        
        return rows.joined(separator: "\n")
    }
    
    public func createVertex(_ data: T) -> Vertex<T> {
        
        let matchingVertices = adjacencyList.filter{ $0.vertex.data == data }
        
        guard matchingVertices.count == 0 else {
            return matchingVertices.last!.vertex
        }
        
        let vertex = Vertex<T>.init(data: data, index: adjacencyList.count)
        let newEdge = EdgeList<T>(vertex: vertex)
        adjacencyList.append(newEdge)
        
        return vertex
        
    }
    
    public func addEdge(type: EdgeType, _ from: Vertex<T>, to: Vertex<T>, weight: Double?) {
        switch type {
        case .directed:
            addDirectEdge(from, to: to, weight: weight)
        case .undirected:
            addUnDirectEdge(vertices: (from, to), weight: weight)
        }
    }
    
    public func weightFrom(_ sourceVertex: Vertex<T>, to destinationVertex: Vertex<T>) -> Double? {
        guard sourceVertex.index < adjacencyList.count else {
            return nil
        }
        
        let sourceEdges = adjacencyList[sourceVertex.index].edges
        
        for edge in sourceEdges {
            if edge.to == destinationVertex {
                return edge.weight
            }
        }
        
        return nil
    }
    
    public func edgesFrom(_ sourceVertex: Vertex<T>) -> [Edge<T>] {
        
        guard sourceVertex.index < adjacencyList.count else {
            return []
        }
        
        return adjacencyList[sourceVertex.index].edges
        
    }
    
}
