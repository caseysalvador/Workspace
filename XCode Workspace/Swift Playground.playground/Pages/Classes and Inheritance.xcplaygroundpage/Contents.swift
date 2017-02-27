//Classes & Inheritance

/*
 - Define properties
 - Define methods to provide functionality
 - Define subscripts to provide access to their values using subscript syntax
 - Define initializers to set up their initial state
 - Be extended to expand their functionality beyond a default implementation
 - Conform to protocols to provide standard functionality of a certain kind
 
- Classes have additional capabilities that structures do not:
 - Inheritance enabless one class to inherit the characteristics of another
 - Type casting enables you to check and interpret the type of a class instance at runtime
 - Deinitializers enable an instance of a class to free up any resources if has assigned
 - Reference counting allows more than one referance to a class instance
 */

import Foundation

//var blogTitle1 = "Hello, playground"
//var blogBody1 = "Text of the article"
//var blogAuthor1 = "Casey Salvador"
//
//var blogTitle2 = "Goodbye, playground"
//var blogBody2 = "Text of the article"
//var blogAuthor2 = "Casey Salvador"

// Class Syntax
class BlogPost {
    
    var title = ""
    var body = ""
    var author = ""
    
    //create a new function within a class
    var numberOfComments = 0
    func addComment() {
        numberOfComments += 1
    }
    
}

let myPost = BlogPost() // new instance of BlogPost type called an Object (BlogPost object)

myPost.title = "Hello Playground"
myPost.author = "Casey Salvador"
myPost.body = "Hello"
myPost.addComment() // call add comment function
print(myPost.numberOfComments) // print out numberOfComments

let mySecondPost = BlogPost()
mySecondPost.title = "Goodbye Playground"
mySecondPost.author = "Casey Salvador"
mySecondPost.body = "Goodbye"
print(mySecondPost.numberOfComments) // did not call mySecondPost.addComment() so it prints out 0



// Inheritance
// one class inherits from another class so you don't need to redefine them.
class Car {
    var topSpeed = 200
    func drive() {
        print("Driving at \(topSpeed)")
    }
}

class FutureCar: Car { // inherits from Car class
    
    override func drive() { // override the super class function
        
        super.drive() // super refers to the super class by calling the original definition
        print("and rockets boosting at 50")
        
    }
    
    func fly() {
        print("Flying")
    }
    
}

let myRide = Car() // assigning a constant with Car instance object
myRide.topSpeed
myRide.drive()

print() // new line

let myNewRide = FutureCar() // new instance of FutureCar() object assign to constant
myNewRide.topSpeed
myNewRide.drive()
myNewRide.fly()