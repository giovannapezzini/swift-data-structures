/*: Bubble Sort Introduction
 # Bubble Sort
 ### Compares & swaps adjacent values 🫧
 
 Iterates through a collection, compares adjacent values and swaps then into a sorted order.
 
 The larger values in a set "bubble up" to the end of the collection.
 
 🥶 One of the worst performing sorts (unsorted collections)
 
 * note:
Best case scenario O(n)\
Worst case scenario O(n²)
 
 ### Example
 
 9 → 4 → 10 → 3\
 4 → 9 → 3 → 10   *swaps 4 and 9, 3 and 10*\
 4 → 3 → 9 → 10   *swaps 3 and 9*\
 3 → 4 → 9 → 10   *swaps 3 and 4*\
 3 → 4 → 9 → 10   *last pass, no need to swap values*\
 
 */

func bubbleSort<T: Comparable>(_ array: inout [T]) {
    guard array.count >= 2 else { return }
    
    for i in 0..<array.count {
      for j in 1..<array.count - i {
        if array[j] < array[j-1] {
            array.swapAt(j-1, j)
        }
      }
    }
}

var array = [9, 4, 10, 3]
bubbleSort(&array)
