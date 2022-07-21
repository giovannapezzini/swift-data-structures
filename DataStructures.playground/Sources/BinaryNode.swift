import Foundation

public class BinaryNode<T> {
    public var value: T
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: T) {
        self.value = value
    }
}


//extension BinaryNode: CustomStringConvertible {
//    //Note: This algorithm is based on an implementation by Károly Lőrentey in his book Optimizing Collections, available from https://www.objc.io/books/optimizing-collections/.
//    
//    public var description: String { return diagram(for: self) }
//    
//    private func diagram(for node: BinaryNode?,
//                         _ top: String = "",
//                         _ root: String = "",
//                         _ bottom: String = "") -> String {
//        
//        guard let node = node else {
//            return root + "nil\n"
//        }
//        
//        if node.leftChild == nil && node.rightChild == nil {
//            return root + "\(node.value)\n"
//        }
//        
//        return diagram(for: node.rightChild,
//                       top + " ", top + "┌──", top + "│ ")
//        + root + "\(node.value)\n"
//        + diagram(for: node.leftChild,
//                  bottom + "│ ", bottom + "└──", bottom + " ")
//    }
//}
