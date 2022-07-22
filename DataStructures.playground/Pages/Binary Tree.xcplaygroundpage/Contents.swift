/*: Binary Tree Introduction
 # Binary Tree

 Each node have, at most, two child nodes 🍃

  * note:
  To test all types of tree traversal, we're going to use the following binary tree:
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

/*:
 
 # Types of Tree Traversal
 
  ### 1️⃣  In-Order Traversal
  Starts at the root, goes to the left node and moves down to the left child. Having moved all the way down to a leaf node, it stores its data, moves to the parent and then to the right node.
  
 Order of stored values:
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

var inOrderArray: [Int] = []
tree.traverseInOrder { inOrderArray.append($0) }
// [7, 1, 8, 0, 9, 5]

/*:

 ### 2️⃣  Pre-Order Traversal
Visits the current node first, then visits the left and right children recursively.
 
 Order of stored values:

```
     1  → start
    /  \
  2     5
 /  \   /
3    4 6
```
*/

extension BinaryNode {
    func traversePreOrder(visit: (T) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
}

var preOrderArray: [Int] = []
tree.traversePreOrder { preOrderArray.append($0) }
// [0, 1, 7, 8, 5, 9]

/*:

 ### 3️⃣  Post-Order Traversal
Visits the node after all of its children have been visited starting with the left child.
 
 Order of stored values:

```
     6  → start
    /  \
  3     5
 /  \   /
1    2 4
```
 
*/

extension BinaryNode {
    func traversePostOrder(visit: (T) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}

var postOrderArray: [Int] = []
tree.traversePostOrder { postOrderArray.append($0) }
// [7, 8, 1, 9, 5, 0]

/*:
 # Challenge 🏆
 
 * experiment:
 Serialize a binary tree into an array.\
Deserialize the resulting array into the same binary tree.
 
 */

extension BinaryNode {
    func traversePreOrder(visit: (T?) -> Void) {
        visit(value)
        
        if let leftChild = leftChild {
            leftChild.traversePreOrder(visit: visit)
        } else {
            visit(nil)
        }
        
        if let rightChild = rightChild {
            rightChild.traversePreOrder(visit: visit)
        } else {
            visit(nil)
        }
    }
}

// time complexity O(n) space complexity O(n)
func serialize<T>(_ node: BinaryNode<T>) -> [T?] {
    var array: [T?] = []
    node.traversePreOrder { array.append($0) }
    return array
}

let serializedTree = serialize(tree)
//: `serializedTree = [0, 1, 7, nil, nil, 8, nil, nil, 5, 9, nil, nil, nil]`

// time complexity O(n) space complexity O(n)
func deserialize<T>(_ array: inout [T?]) -> BinaryNode<T>? {
    // removeLast() (constant time) instead of removeFirst() (linear time)
    guard let value = array.removeLast() else { return nil }
    
    let node = BinaryNode(value: value)
    node.leftChild = deserialize(&array)
    node.rightChild = deserialize(&array)
    
    return node
}

func deserialize<T>(_ array: [T?]) -> BinaryNode<T>? {
    var reversed = Array(array.reversed())
    return deserialize(&reversed)
}

let deserializedTree = deserialize(serializedTree)
/*:
 ```
      0
     /  \
   1     5
  /  \   /
 7    8 9
 ```
 */
