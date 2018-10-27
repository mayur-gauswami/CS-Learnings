import Foundation

public class AdjacencyMatrixGraph<T> where T: Hashable {
    
    fileprivate var adjacencyMatrix: [[Double?]] = []
    
    fileprivate var _vertices: [Vertex<T>] = []
    
    public init() {}
    
    func addDirectedEdge(_ from: Vertex<T>, to: Vertex<T>, weight: Double?) {
        guard from == vertices[from.index], to == vertices[to.index] else { return }
        adjacencyMatrix[from.index][to.index] = weight
    }
    
    func addUndirectedEdge(_ vertices: (Vertex<T>, Vertex<T>), weight: Double?) {
        let (source, destination) = vertices
        guard source == _vertices[source.index], destination == _vertices[destination.index] else { return }
        adjacencyMatrix[source.index][destination.index] = weight
        adjacencyMatrix[destination.index][source.index] = weight
    }
    
}

extension AdjacencyMatrixGraph: Graphable {
    
    public typealias Element = T
    
    public var vertices: [Vertex<T>] {
        return _vertices
    }
    
    public var edges: [Edge<T>] {
        var edges: [Edge<T>] = []
        
        for row in 0..<adjacencyMatrix.count {
            for column in 0..<adjacencyMatrix.count {
                if let weight = adjacencyMatrix[row][column] {
                    edges.append(Edge<T>(from: vertices[row], to: vertices[column], weight: weight))
                }
            }
        }
        
        return edges
    }
    
    public var description: CustomStringConvertible {
        var rows: [String] = []
        for row in 0..<adjacencyMatrix.count {
            var value: [String] = []
            for column in 0..<adjacencyMatrix.count {
                if let weight = adjacencyMatrix[row][column] {
                    value.append("\(vertices[column].data) (\(weight))")
                }
            }
            if value.count > 0 {
                rows.append("\(vertices[row].data) -> \(value.joined(separator: ","))")
            }
        }
        return rows.joined(separator: "\n")
    }
    
    public func createVertex(_ data: T) -> Vertex<T> {
        let matchingVertices = vertices.filter{ $0.data == data }
        
        guard matchingVertices.count == 0 else {
            return matchingVertices.last!
        }
        
        let vertex = Vertex<T>(data: data, index: vertices.count)
        
        // Add new column for each rows
        for i in 0..<adjacencyMatrix.count {
            adjacencyMatrix[i].append(nil)
        }
        
        // Add new row
        let rows = [Double?](repeating: nil, count: adjacencyMatrix.count + 1)
        adjacencyMatrix.append(rows)
        
        _vertices.append(vertex)
        
        return vertex
    }
    
    public func addEdge(type: EdgeType, _ from: Vertex<T>, to: Vertex<T>, weight: Double?) {
        switch type {
        case .directed:
            addDirectedEdge(from, to: to, weight: weight)
        case .undirected:
            addUndirectedEdge((from, to), weight: weight)
        }
    }
    
    public func weightFrom(_ sourceVertex: Vertex<T>, to destinationVertex: Vertex<T>) -> Double? {
        guard sourceVertex == vertices[sourceVertex.index], destinationVertex == vertices[destinationVertex.index] else{
            return nil
        }
        return adjacencyMatrix[sourceVertex.index][destinationVertex.index]
    }
    
    public func edgesFrom(_ sourceVertex: Vertex<T>) -> [Edge<T>] {
        var edges: [Edge<T>] = []
        let row = adjacencyMatrix[sourceVertex.index]
        for (column, weight) in row.enumerated() where weight != nil {
            edges.append(Edge<T>(from: sourceVertex, to: vertices[column], weight: weight!))
        }
        return edges
    }
    
}

