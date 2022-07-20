/*: Merge Sort Introduction
 # Merge Sort
 ### Divide & Conquer ⚔️
 
 Data is split up into smaller data sets that are easier to sort. Those smaller sets are sorted and then combined into a final result.
 
 ### Steps:
 1. Split the pile into two until you cannot split anymore.
 2. Merge the piles together in sorted order.
 
 * note:
 One of the more efficient sorting algorithms\
 O(n log n)
 
 ### Example - Split
 `[7, 1, 6, 3] → [7, 1] [6, 3] → [7] [1] [6] [3]`
 
 ### Example - Merge
 `left [1, 7] right [3, 6] → [ ]`                     *1 and 3, append(1)*
 
 `left [1, 7] right [3, 6] → [1]`                     *7 and 3, append(3)*
 
 `left [1, 7] right [3, 6] → [1, 3]`              *7 and 6, append(6)*
 
 `left [1, 7] right [3, 6] → [1, 3, 6]`       *7 is left, append(7)*
 
 `ordered [1, 3, 6, 7]`
 */

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    
    let middle = array.count / 2
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    
    return merge(left, right)
}

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var result: [T] = []
    result.reserveCapacity(left.count + right.count)
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        } else {
            result.append(leftElement)
            result.append(rightElement)
            leftIndex += 1
            rightIndex += 1
        }
    }
    
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    
    return result
}

var array = [7, 2, 6, 3, 3, 9, 15, 4, 11]
mergeSort(array)
