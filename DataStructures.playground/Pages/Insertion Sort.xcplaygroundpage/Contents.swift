/*: Insertion Sort Introduction
 # Insertion Sort
 ### Slightly more performant than Bubble and Selection Sort. 🔙

 Iterates only once through the entire collection, from left to right.
 
 * note:
 Average time complexity of O(n²)\
Best-case scenario, the data is already sorted: O(n)
 
 ### Example
 
 9 → 4 → 10 → 3\
 4 → 9 → 10 → 3    *swaps 4 and 9*\
 3 → 4 → 9 → 10    *3 shifts all the way to the left*
 
*/

func insertionSort<T: Comparable>(_ array: inout [T]) {
    for i in 1..<array.count {
        var currentIndex = i
        
        while currentIndex > 0 && array[currentIndex] < array[currentIndex-1] {
            array.swapAt(currentIndex-1, currentIndex)
            currentIndex -= 1
        }
    }
}

var array = [9, 4, 10, 3]
insertionSort(&array)
