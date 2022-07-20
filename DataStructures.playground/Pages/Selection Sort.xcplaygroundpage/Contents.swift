/*: Selection Sort Introduction
 # Selection Sort
 ### Only swaps at the end of each pass. ☑️
 
 Similar to Bubble Sort.
 
 Pulls the lower values to the bottom. It will find the lowest unsorted value and swap it into place.
 
 ### Example
 
 9 → 4 → 10 → 3    *find the lowest value*\
 3 → 4 → 10 → 9    *swaps 3 with the first value*\
 9 → 4 → 9 → 10    *4 is already in place, 9 is the next lowest number*
 
*/

func selectionSort<T: Comparable>(_ array: inout [T]) {
    guard array.count >= 2 else { return }
    
    for current in 0..<array.count - 1 {
        var lowest = current
        
        for other in current + 1..<array.count {
            if array[other] < array[lowest] {
                lowest = other
            }
        }
        
        if current != lowest {
            array.swapAt(current, lowest)
        }
    }
}

var array = [9, 4, 10, 3]
selectionSort(&array)
