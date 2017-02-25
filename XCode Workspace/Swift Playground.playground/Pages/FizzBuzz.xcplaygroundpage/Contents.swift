//: [Previous](@previous)

import Foundation

// FizzBuzz 15

var numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]


for num in numbers {
    if num % 15 == 0 {
        print("\(num) fizzbuzz")
    } else if num % 3 == 0 {
        print("\(num) fizz")
    } else if num % 5 == 0 {
        print("\(num) buzz")
    } else {
        print(num)
    }
}

//----------------------------------------------------------------------

// FizzBuzz 1000

// create an array of numbers in this instance 1000
var oneThousandNumbers = [Int]()
for i in 1...1000 {
    oneThousandNumbers.append(i)
}

// FizzBuzz for 1000 Numbers
for num1 in oneThousandNumbers {
    if num1 % 15 == 0 {
        print("\(num1) fizzbuzz")
    } else if num1 % 3 == 0 {
        print("\(num1) fizz")
    } else if num1 % 5 == 0 {
        print("\(num1) buzz")
    } else {
        print(num1)
    }
}