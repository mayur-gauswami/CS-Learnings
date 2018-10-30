//: [Previous](@previous)
/*:
 # Depth First Search
 */
import Foundation

enum Visit<Element: Hashable> {
    case source(Vertex<Element>)
    case edge(Edge<Element>)
    
    var vertex: Vertex<Element> {
        switch self {
        case .source(let node): return node
        case .edge(let edge): return edge.to
        }
    }
    
    var edge: Edge<Element>? {
        switch self {
        case .source: return nil
        case .edge(let edge): return edge
        }
    }
}

extension Graphable {
    
    func depthFirstSearch(_ source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>] {
        
        if source == destination {
            return []
        }
        
        var route = Array<Visit<Element>>()
        var visited = Set<Vertex<Element>>()
        
        route.append(.source(source))
        visited.insert(source)
        
        outer: while let vertex = route.last?.vertex, vertex != destination {
            
            let neighbours = edgesFrom(vertex)
            
            guard neighbours.count > 0 else {
                route.removeLast()
                continue
            }
            
            for edge in neighbours {
                if !visited.contains(edge.to) {
                    visited.insert(edge.to)
                    route.append(.edge(edge))
                    continue outer
                }
            }
            
            route.removeLast()
            
        }
        
        return route.compactMap{ $0.edge }
    }
    
}

let graphList = AdjacencyListGraph<String>()
var A = graphList.createVertex("A")
var B = graphList.createVertex("B")
var C = graphList.createVertex("C")
var D = graphList.createVertex("D")
var E = graphList.createVertex("E")

graphList.addEdge(type: .undirected, A, to: B, weight: 3)
graphList.addEdge(type: .directed, A, to: C, weight: 5)
graphList.addEdge(type: .directed, C, to: D, weight: 1)
graphList.addEdge(type: .undirected, A, to: D, weight: 6)
graphList.addEdge(type: .directed, C, to: E, weight: 1)

let route = graphList.depthFirstSearch(B, to: D)
print(route)

//: [Next](@next)
