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
    var capacity: Int

    init (_ capacity: Int)
    {
        self.capacity = capacity
        //stack = Array(repeating:  , count: capacity)
    }
    
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
    
    func push(_ element: Element) -> Bool{
        if stack.count < capacity {
            stack.append(element)
            return true
        }
        else{
            return false
        }
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
    
    func partition(
        low: Int,
        high: Int,
        condition: (Element, Element) -> Bool
    ) -> Int{
        let pivotIndex = Int.random(in: low...high)
        let temp = stack[pivotIndex]
        stack[pivotIndex] = stack[high]
        stack[high] = temp
        let pivot = stack[high]
        var lowerIndex = low
        for index in low..<high{
            if !condition(stack[index], pivot){ // <=
                let temp = stack[index]
                stack[index] = stack[lowerIndex]
                stack[lowerIndex] = temp
                lowerIndex+=1
            }
        }
       let tempVal = stack[lowerIndex]
       stack[lowerIndex] = stack[high]
       stack[high] = tempVal
       return lowerIndex
    }
    
    func QuickSort(condition: (Element, Element) -> Bool) -> [Element]{
        QuickSort(low: 0, high: stack.count - 1, condition: condition)
        return stack
    }
    
    func QuickSort(
        low: Int,
        high: Int,
        condition: (Element, Element) -> Bool
    ) -> Void{
        if low >= high{
            return
        }
        let pivotLocation = partition(low: low, high: high, condition: condition)
        QuickSort(low: low, high: pivotLocation - 1, condition: condition)
        QuickSort(low: pivotLocation + 1, high: high, condition: condition)
    }
    
    func removeDuplicate(_ equalityTest: (Element, Element)->Bool) -> Void{
        var index = 0
        while true{
            let baseElement = stack[index]
            var indexToCompare = index + 1
            for compared in index+1..<stack.count{
                if equalityTest(baseElement, stack[indexToCompare]){
                    stack.remove(at: compared)
                }
                else{
                    indexToCompare+=1
                    if (indexToCompare >= stack.count){
                        break
                    }
                }
            }
            index+=1
            if (index >= stack.count){
                break
            }
        }
    }
    
    func insertAtIndex(_ element: Element, index: Int) -> Bool{
        if stack.count < capacity{
            if index < stack.count{
                stack.insert(element, at: index)
                return true
            }
            else if index == stack.count{
                stack.append(element)
                return true
            }
        }
        return false
    }
    
    func removeElementAt(_ index: Int)
    {
        if index < stack.count{
            stack.remove(at: index)
        }
    }
    
    func resiveCapacity(_ newValue: Int) -> Void{
        capacity = newValue
    }
}
