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

var myStack = Stack<Node>(8)
for number in 0...10{
    let node = Node()
    if myStack.push(node){
        print("\(node.description) is pushed to the stack ..")
    }
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
var node = Node()
print("Currently the stack is full Capacity so the push operation will fail :")
print("The result of push is \(myStack.push(node))")
print("We will resize the stack to 20 instead of 8 :")
myStack.resiveCapacity(20)
print("After resizing the stack, the result of push is \(myStack.push(node))")

print("\nWe'll pop all the element from the stack ...")
func sort(_ a: Node, _ b: Node) -> Bool{
    if (a.id > b.id){
        return true
    }
    return false
}
myStack.QuickSort(condition: sort)
while !myStack.isEmpty(){
    do{
        try print(myStack.pop().description)
    }
    catch{
        print("The stack is Empty ..")
    }
}
print("is Empty says finally \(myStack.isEmpty())")
print("\nTest Queue class with sorting after adding all values ...\n")
var myQueue = Queue<Node>(40)
for number in 0...10{
    let node = Node()
    if myQueue.add(node){
        print("\(node.description) is pushed to the queue ..")
    }
    do{
        if false{//number%4 == 0{
            try print("The top element is \(myQueue.peek().description), is empty says \(myQueue.isEmpty())")
            print("Let's do a remove ..")
            let value = try myQueue.remove()
            print("The removed value is \(value.description) and the current peek is \(try myQueue.peek().description)")
        }
    }
    catch{
        print("The Queue is Empty ...")
    }
}
print("\nWe'll remove all the element from the Queue ...")
myQueue.QuickSort(condition: sort)
print("The sorted queue is shown below:")
while !myQueue.isEmpty(){
    do{
        try print(myQueue.remove().description)
    }
    catch{
        print("The Queue is Empty ..")
    }
}
print("Queue is Empty says finally \(myStack.isEmpty())\n")
var stack = Stack<Int>(15)
stack.push(119)
stack.push(406)
stack.push(300)
stack.push(690)
stack.push(546)
stack.push(567)
stack.push(395)
stack.push(206)
stack.push(906)
stack.push(528)

func sort2(_ a:Int, _ b: Int) -> Bool{
    return a > b
}
var sortedStack = stack.QuickSort(condition: sort2)
for number in sortedStack{
    print(number)
}

print("Let's add two new values to the stack which are identical to another two , 906 and 300, then add value 44 at index 4 and remove element at index 0 afer that ..")
stack.push(906)
stack.push(300)
print("Let's see if the duplicates removed by the removeDuplicates function and insert at added 44 at 4 and remove element at index 0: ")
stack.removeDuplicate({(a: Int, b: Int) -> Bool in a == b})
stack.insertAtIndex(44, index: 4)
stack.removeElementAt(0)
while !stack.isEmpty(){
    do{
        try print(stack.pop())
    }
    catch{
        print("The stack is Empty ..")
    }
}
