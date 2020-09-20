//
//  main.swift
//  StacksQueues
//
//  Created by Asal 1 on 9/20/20.
//  Copyright © 2020 Asal 1. All rights reserved.
//

import Foundation

enum StackError: Error{
    case EmptyStack
}

class Stack<Element>{
    var stack: [Element] = []
    
    func pop() throws -> Element {
        if !isEmpty(){
            let lastElement = stack[stack.count - 1]
            stack.remove(at: stack.count - 1)
            return lastElement
        }
        else{
            throw StackError.EmptyStack
        }
    }
    
    func push(_ element: Element) -> Void{
        stack.append(element)
    }
    
    func peek() throws -> Element {
        let indexOfLast = stack.count - 1
        if indexOfLast < 0{
            throw StackError.EmptyStack
        }
        return stack[indexOfLast]
    }
    
    func isEmpty() -> Bool{
        if stack.count == 0{
            return true
        }
        else{
            return false
        }
    }
}

class Node{
    let id = Int.random(in: 0...1000)
    var description: String{
        return "Node ID is \(id)"
    }
}
var myStack = Stack<Node>()
for number in 0...10{
    let node = Node()
    myStack.push(node)
    print("\(node.description) is pushed to the stack ..")
    do{
        if number%4 == 0{
            try print("The top element is \(myStack.peek().description), is empty says \(myStack.isEmpty())")
            print("Let's do a pop ..")
            let value = try myStack.pop()
            print("The popped value is \(value.description) and the current peek is \(try myStack.peek().description)")
        }
    }
    catch{
        print("The stack is Empty ...")
    }
}
print("\nWe'll pop all the element from the stack ...")
while !myStack.isEmpty(){
    do{
        try myStack.pop()
    }
    catch{
        print("The stack is Empty ..")
    }
}
print("is Empty says finally \(myStack.isEmpty())")
print("\nHello, World from Rahaf!")

