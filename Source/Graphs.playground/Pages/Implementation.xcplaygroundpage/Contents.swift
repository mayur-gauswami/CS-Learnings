//: [Previous](@previous)
/*:
 ## Graph - using Adjacenecy List
 */
let graphList = AdjacencyListGraph<String>()
let A = graphList.createVertex("A")
let B = graphList.createVertex("B")
let C = graphList.createVertex("C")
let D = graphList.createVertex("D")

graphList.addEdge(type: .directed, A, to: B, weight: nil)
graphList.addEdge(type: .directed, A, to: C, weight: nil)
graphList.addEdge(type: .directed, C, to: D, weight: nil)
graphList.addEdge(type: .undirected, A, to: D, weight: nil)

print("-----")
print(graphList.description)
/*:
 ## Graph - using Adjacenecy Matrix
 */
let graphMatrix = AdjacencyMatrixGraph<String>()
let E = graphMatrix.createVertex("E")
let F = graphMatrix.createVertex("F")
let G = graphMatrix.createVertex("G")
let H = graphMatrix.createVertex("H")

graphMatrix.addEdge(type: .directed, E, to: F, weight: 3)
graphMatrix.addEdge(type: .directed, E, to: G, weight: 5)
graphMatrix.addEdge(type: .directed, G, to: H, weight: 1)
graphMatrix.addEdge(type: .undirected, E, to: H, weight: 6)

print("-----")
print(graphMatrix.description)
//: [Next](@next)
