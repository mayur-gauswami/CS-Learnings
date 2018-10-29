//: [Previous](@previous)
/*:
 # Breadth First Search
 */
import Foundation

enum Visit<Element: Hashable> {
    case source
    case edge(Edge<Element>)
}

extension Graphable {
    
    func breadthFirstSearch(_ source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>] {
        
        var queue: Queue<Vertex<Element>> = Queue()
        queue.enqueue(source)
        
        var visits: [Vertex<Element>: Visit<Element>] = [source: .source]
        
        while let visitedVertex = queue.dequeue() {
            
            if visitedVertex == destination {
                var route: [Edge<Element>] = []
                var vertex = destination
                
                while let visit = visits[vertex], case .edge(let edge) = visit {
                    route = [edge] + route
                    vertex = edge.from
                }
                
                return route
            }
            
            let neightbourEdges = edgesFrom(visitedVertex)
            
            for edge in neightbourEdges {
                if visits[edge.to] == nil {
                    queue.enqueue(edge.to)
                    visits[edge.to] = .edge(edge)
                }
            }
            
        }
        
        return []
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

let route = graphList.breadthFirstSearch(B, to: E)
print(route)

//: [Next](@next)
