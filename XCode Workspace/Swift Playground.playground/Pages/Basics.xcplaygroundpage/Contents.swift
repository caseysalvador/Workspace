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


// Inheritance
// parent class
class Vehicle {
    var tires = 4
    var make: String?
    var model: String?
    var currentSpeed: Double = 0
    
    init() {
        print("I am the parent")
    }
    
    func drive(speedIncrease: Double){
        currentSpeed += speedIncrease * 2
    }
    
    func brake(){
        
    }
}


// sub class for Inheritance
class sportsCar: Vehicle{ // inherits from vehicle class
    override init() {
        super.init() // calling parent class explicitly
        print("I am the child")
        make = "BMW"
        model = "M3"
    }
    
    //override the functions from parent class
    override func drive(speedIncrease: Double) {
        currentSpeed += speedIncrease * 3
    }
}


class Truck: Vehicle {
    override init() {
        super.init() // calling parent class explicitly
        print("I am the 2nd child")
        make = "Ford"
        model = "F150"
    }
    
    override func drive(speedIncrease: Double) {
        currentSpeed += speedIncrease * 4
    }
}

let car = sportsCar()
let trucks = Truck()

print() // new line...



// Polymorphism
class Shape { // parent class
    var area: Double?
    
    func calculateArea(valA: Double, valB: Double) {
        
    }
}

class Triangle: Shape { // inherit from shape
    override func calculateArea(valA: Double, valB: Double) {
        area = (valA * valB) / 2
    }
}

class Rectangle: Shape { // inherit from shape
    override func calculateArea(valA: Double, valB: Double) {
        area = valA * valB
    }
}

// check compiler error