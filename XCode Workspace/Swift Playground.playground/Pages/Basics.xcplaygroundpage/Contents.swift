import UIKit

// Basic String
var str = "Hello, playground"

// Constants
let newInt = 5
let newStr = "Good evening everyone!"

// Concatenation
var food = "Sushi"
var addStr = "I enjoy eating "
var whatDoYouEat = addStr + food

// Inference
let date = Date()
let formatter = DateFormatter()
formatter.dateFormat = "MM-dd-yyyy"
let finalDate = formatter.string(from: date)

var whatDate = "Today's date is \(finalDate)"

