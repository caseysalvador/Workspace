import Foundation

//// Node Class
//class Node {
//    let value: Int
//    var next: Node?
//    init(value: Int) {
//        self.value = value
//    }
//}



// Stack
//class Stack { // Class Stack
//    
//    var top: Node?
//    
//    
//    func push(_ value: Int) { // pushes an Integer into Stack class
//        let oldTop = top
//        top = Node(value: value)
//        top?.next = oldTop
//    }
//    
//    func pop() -> Int? { // returns some kind of integer, empty stack can return nil
//        let currentTop = top
//        top = top?.next
//        return currentTop?.value
//    }
//    
//    func peek() -> Int? {
//        return top?.value
//    }
//    
//}


// new stack object
//let stack = Stack()
//stack.push(1)
//stack.push(2)
//stack.push(3)
//
//stack.peek() // peek at the top most value
//
//let firstPop = stack.pop() // should return 3 top of stack
//let secondPop = stack.pop() // should return 2
//let thirdPop = stack.pop() // should return 1
//let finalPop = stack.pop() // returns nil



// Stack & Node Class with Generics
// Node Class with Generics <T> for type
class Node<T> {
    let value: T
    var next: Node?
    init(value: T) {
        self.value = value
    }
}

class Stack<T> { // Class Stack
    
    var top: Node<T>?
    
    
    func push(_ value: T) { // pushes an Integer into Stack class
        let oldTop = top
        top = Node(value: value)
        top?.next = oldTop
    }
    
    func pop() -> T? { // returns some kind of integer, empty stack can return nil
        let currentTop = top
        top = top?.next
        return currentTop?.value
    }
    
    func peek() -> T? {
        return top?.value
    }
    
}


// perhaps you want to push other things than Int to Stack
// need to support other values other than Int.
struct User {
    let name: String
    let username: String
}

let me = User(name: "Casey", username: "@mrkeishii")
let you = User(name: "You", username: "@you")

let usersStack = Stack<User>()
usersStack.push(me)
usersStack.push(you)

let firstUserPop = usersStack.pop()
print(firstUserPop?.name ?? "")


// new stack object
let stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)

stack.peek() // peek at the top most value

let firstPop = stack.pop() // should return 4 top of stack
let secondPop = stack.pop() // should return 3
let thirdPop = stack.pop() // should return 2
let fourthPop = stack.pop() // should return 1
let finalPop = stack.pop() // returns nil






