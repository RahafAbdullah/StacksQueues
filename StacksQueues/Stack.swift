//
//  Stack.swift
//  StacksQueues
//
//  Created by Asal 1 on 9/20/20.
//  Copyright © 2020 Asal 1. All rights reserved.
//

import Foundation

enum StackError: Error{
    case EmptyStack
    case EmptyQueue
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
