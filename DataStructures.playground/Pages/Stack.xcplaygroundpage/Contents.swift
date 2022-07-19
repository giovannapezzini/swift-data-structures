//#-hidden-code
//#-end-hidden-code
/*: Stack Introduction
 # Stack
 ### LIFO, last in, first out 🥞
 
 ### Methods
 1. `push()` → adds item on top
 2. `pop()` → removes top item
 
 ### Useful resources
 `peek()` → last element

 var `isEmpty` → peek == nil
 
* callout(Extensions):
**CustomStringConvertible** → used to change print description\
**ExpressibleByArrayList** → to allow the stack to be initialized with an array literal.
*/

var stack = Stack([1, 2, 3])
stack.push(4)
stack.pop()
stack.peek()
stack.isEmpty

var arrayLiteralStack: Stack = [1, 2, 3]
print(arrayLiteralStack)

/*:
 
 # Challenge
 
 * experiment:
 Use a stack to check for balanced parentheses
 */

func checkParentheses(for string: String) -> Bool {
    var stack = Stack<Character>()
    
    for char in string {
        if char == "(" {
            stack.push(char)
        } else if char == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
        }
    }
    
    return stack.isEmpty
}

checkParentheses(for: "(hello)")
checkParentheses(for: "(hello))")
