// Binary Search Algorithm

import Foundation

print("Linear Search Algorithm")
let numbers = [1,2,4,6,8,9,11,13,16,17,20] // create an array of numbers

// Linear Search
func linearSearchForSearchValue(searchValue: Int, array: [Int]) -> Bool {   // loops 11 times numbers.count()
    for num in array {
        if num == searchValue {
            return true
        }
    }
    return false
}

print(linearSearchForSearchValue(searchValue: 5, array: numbers))
print()
print("---------------------------------------------") // new line
print()
print("Binary Search Algorithm")



//let numbers = [1,2,4,6,8,9,11,13,16,17,20] copy of array from above to view Binary Search Algorithm.

// Binary Search
// binary means 2 divide into 2 and search values in first part then second part of the array.
func binarySearchForSearchValue(searchValue: Int, array: [Int]) -> Bool {
    var leftIndex = 0 // beginning index of the array
    var rightIndex = array.count - 1 //last index of the array (in this case we have 10 items in the list 0-10)
    
    while leftIndex <= rightIndex { // checking
        
        let middleIndex = (leftIndex + rightIndex) / 2 // search for middle index / value
        let middleValue = array[middleIndex] // middleIndex = 5 in this case index of 5 is middleValue of 9
        
        print("middleValue: \(middleValue), leftIndex: \(leftIndex), rightIndex: \(rightIndex), array: [\(array[leftIndex]), \(array[rightIndex])]")
        
        if middleValue == searchValue { // returns 9 as the middleValue
            return true
        }
        
        if searchValue < middleValue { // search left side of the array
            rightIndex = middleIndex - 1
        }
        
        if searchValue > middleValue { // search right side of the array
            leftIndex = middleIndex + 1
        }
        
    }
    
    return false
}

print(binarySearchForSearchValue(searchValue: 20, array: numbers))

print()

print("using an array of 100 numbers")

// Append 100 numbers to hundred empty array variable
var hundred = [Int]()
for i in 1...100{
    hundred.append(i)
}

print(binarySearchForSearchValue(searchValue: 99, array: hundred))