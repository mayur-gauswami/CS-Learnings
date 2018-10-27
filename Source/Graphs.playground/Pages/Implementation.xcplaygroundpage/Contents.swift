//: [Previous](@previous)
/*:
 ## Graph - using Adjacenecy List
 */
let graphList = AdjacencyListGraph<String>()
var A = graphList.createVertex("A")
var B = graphList.createVertex("B")
var C = graphList.createVertex("C")
var D = graphList.createVertex("D")

graphList.addEdge(type: .directed, A, to: B, weight: 3)
graphList.addEdge(type: .directed, A, to: C, weight: 5)
graphList.addEdge(type: .directed, C, to: D, weight: 1)
graphList.addEdge(type: .undirected, A, to: D, weight: 6)

print("-----")
print(graphList.description)
/*:
 ## Graph - using Adjacenecy Matrix
 */
let graphMatrix = AdjacencyMatrixGraph<String>()
A = graphMatrix.createVertex("A")
B = graphMatrix.createVertex("B")
C = graphMatrix.createVertex("C")
D = graphMatrix.createVertex("D")

graphMatrix.addEdge(type: .directed, A, to: B, weight: 3)
graphMatrix.addEdge(type: .directed, A, to: C, weight: 5)
graphMatrix.addEdge(type: .directed, C, to: D, weight: 1)
graphMatrix.addEdge(type: .undirected, A, to: D, weight: 6)

print("-----")
print(graphMatrix.description)
//: [Next](@next)
