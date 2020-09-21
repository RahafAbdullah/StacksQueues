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
    var capacity: Int
    
    init (_ capacity: Int)
    {
        self.capacity = capacity
    }
    
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
    
    func add(_ element: Element) -> Bool{
        if queue.count < capacity{
            queue.append(element)
            return true
        }
        else{
            return false
        }
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
    
    func partition(
        low: Int,
        high: Int,
        condition: (Element, Element) -> Bool
    ) -> Int{
        let pivotIndex = Int.random(in: low...high)
        let temp = queue[pivotIndex]
        queue[pivotIndex] = queue[high]
        queue[high] = temp
        let pivot = queue[high]
        var lowerIndex = low
        for index in low..<high{
            if !condition(queue[index], pivot){ // <=
                let temp = queue[index]
                queue[index] = queue[lowerIndex]
                queue[lowerIndex] = temp
                lowerIndex+=1
            }
        }
       let tempVal = queue[lowerIndex]
       queue[lowerIndex] = queue[high]
       queue[high] = tempVal
       return lowerIndex
    }
    
    func QuickSort(condition: (Element, Element) -> Bool) -> [Element]{
        QuickSort(low: 0, high: queue.count - 1, condition: condition)
        return queue
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
            let baseElement = queue[index]
            var indexToCompare = index + 1
            for compared in index+1..<queue.count{
                if equalityTest(baseElement, queue[indexToCompare]){
                    queue.remove(at: compared)
                }
                else{
                    indexToCompare+=1
                    if (indexToCompare >= queue.count){
                        break
                    }
                }
            }
            index+=1
            if (index >= queue.count){
                break
            }
        }
    }
    
    func insertAtIndex(_ element: Element, index: Int) -> Bool{
        if queue.count < capacity{
            if index < queue.count{
                queue.insert(element, at: index)
                return true
            }
            else if index == queue.count{
                queue.append(element)
                return true
            }
        }
        return false
    }
    
    func removeElementAt(_ index: Int)
    {
        if index < queue.count{
            queue.remove(at: index)
        }
    }
    
    func resiveCapacity(_ newValue: Int) -> Void{
        capacity = newValue
    }
    
}
