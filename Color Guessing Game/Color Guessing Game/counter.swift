//
//  counter.swift
//  Color Guessing Game
//
//  Created by Jason Ruan on 7/30/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import Foundation

struct Counter {
    var count = 0
    static var highestScoreRecorded = 0
    
    mutating func increaseScore() {
        self.count += 1
    }
    
    mutating func resetScore() {
        count = 0
    }
    
}
