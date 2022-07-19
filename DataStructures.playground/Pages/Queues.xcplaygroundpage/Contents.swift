/*: Queues Introduction
 # Queues
 ### FIFO, first in, first out 👯👯
 
 Queues can be implemented using Arrays or Stacks.
 
 ### Methods
 1. `enqueue()` → add to the back of a queue
 2. `dequeue()` → removes item from the front
 
 ### Useful resources
 var `isEmpty`
 
 `peek()` → returns first element
 
 * note:
 **Array Time Complexity**\
`enqueue()` O(1),\
`dequeue()` O(n)\
`space complexity` O(n)
 
*/

var queueArray = QueueArray<String>()
queueArray.enqueue("Bird")
queueArray.enqueue("Cat")
queueArray.enqueue("Dog")
queueArray.dequeue()
// array = ["Cat", "Dog"]

/*:
 * note:
 **Stack Time Complexity**\
`enqueue()` O(1),\
`dequeue()` O(1) 🎉\
`space complexity` O(n)
*/

var queueStack = QueueStack<String>()
queueStack.enqueue("Bird")
queueStack.enqueue("Cat")
queueStack.enqueue("Dog")
queueStack.dequeue()
// enqueueStack = []
// dequeueStack = ["Dog", "Cat"]

/*:
 # Challenge 🏆

 * experiment:
 Extend a Queue to track which player is next using the `BoardGameManager` protocol.
 */

protocol BoardGameManager {
    associatedtype Player
    mutating func nextPlayer() -> Player?
}

extension QueueStack: BoardGameManager {
    typealias Player = T
    
    mutating func nextPlayer() -> Player? {
        guard let player = dequeue() else { return nil }
        enqueue(player)
        return player
    }
}

var gameQueue = QueueStack<String>()
gameQueue.enqueue("Kirby")
gameQueue.enqueue("Samus")
gameQueue.enqueue("Toon")
gameQueue.nextPlayer() // Kirby
gameQueue.nextPlayer() // Samus
gameQueue.nextPlayer() // Toon
gameQueue.nextPlayer() // Kirby
