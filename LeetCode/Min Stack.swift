//
//  Min Stack.swift
//  
//
//  Created by chihoooon on 2022/03/31.
//

import Foundation

class MinStack {
    var minValue: Int
    var stack: [Int]
    
    init() {
        self.minValue = 2 << 30
        self.stack = []
    }
    
    func push(_ val: Int) {
        self.minValue = min(self.minValue, val)
        self.stack.append(val)
    }
    
    func pop() {
        let top = self.stack.last!
        self.stack.removeLast()
        
        if top == self.minValue {
            if self.stack.isEmpty {
                self.minValue = 2 << 30
            }
            else {
                self.minValue = self.stack.min()!
            }
            
        }
    }
    
    func top() -> Int {
        return self.stack.last!
    }
    
    func getMin() -> Int {
        return self.minValue
    }
}
