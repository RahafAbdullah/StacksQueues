//
//  Queue.swift
//  StacksQueues
//
//  Created by Asal 1 on 9/20/20.
//  Copyright © 2020 Asal 1. All rights reserved.
//

import Foundation


class Queue<Element>{
    var queue: [Element] = []
    
    func remove() throws -> Element {
        if !isEmpty(){
            let firstElement = queue[0]
            queue.remove(at: 0)
            return firstElement
        }
        else{
            throw StackError.EmptyQueue
        }
    }
    
    func add(_ element: Element) -> Void{
        queue.append(element)
    }
    
    func peek() throws -> Element {
        if isEmpty(){
            throw StackError.EmptyStack
        }
        return queue[0]
    }
    
    func isEmpty() -> Bool{
        if queue.count == 0{
            return true
        }
        else{
            return false
        }
    }
}
