//
//  main.swift
//  StacksQueues
//
//  Created by Asal 1 on 9/20/20.
//  Copyright © 2020 Asal 1. All rights reserved.
//

import Foundation


class Node{
    let id = Int.random(in: 0...1000)
    var description: String{
        return "Node of ID \(id)"
    }
}
print("\nHello, World from Rahaf!\n")
print("Test stack class ...\n")
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



