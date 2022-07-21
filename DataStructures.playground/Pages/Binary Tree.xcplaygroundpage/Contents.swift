/*: Binary Tree Introduction
 # Binary Tree

 Each node have, at most, two child nodes 🍃
 
 # Types of Tree Traversal
 
  **In-Order Traversal**\
  Starts at the root, goes to the left node and moves down to the left child. Having moved all the way down to a leaf node, it stores its data, moves to the parent and then to the right node.
  
 ```
       4  → start
      /  \
    2     6
   /  \   /
  1    3 5
 ```
 */

extension BinaryNode {
    func traverseInOrder(visit: (T) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
}

/*:
 **In-Order Traversal in code**

```
      0
     /  \
   1     5
  /  \   /
 7    8 9
 
array = [7, 1, 8, 0, 9, 5]
```
 */

var tree: BinaryNode<Int> = {
    let zero = BinaryNode(value: 0)
    let one = BinaryNode(value: 1)
    let five = BinaryNode(value: 5)
    let seven = BinaryNode(value: 7)
    let eight = BinaryNode(value: 8)
    let nine = BinaryNode(value: 9)
    
    zero.leftChild = one
    zero.rightChild = five
    one.leftChild = seven
    one.rightChild = eight
    five.leftChild = nine
    
    return zero
}()

var array: [Int] = []
tree.traverseInOrder { array.append($0) }
