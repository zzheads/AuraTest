//
//  Incrementor.swift
//  IntTest
//
//  Created by Алексей Папин on 31.10.2019.
//  Copyright © 2019 Алексей Папин. All rights reserved.
//

import Foundation

/// ## Protocol declares three functions:
///
/// - getNumber() -> Int
/// - incrementNumber()
/// - set(maximumValue: Int) throws
protocol IncrementorProtocol {
    /// Returns current value of implementing class
    func getNumber() -> Int
    /// Increments 'Int' value of implementing class
    func incrementNumber()
    /// Sets 'Int' maximum value of implementing class, can't be less than zero
    func set(maximumValue: Int) throws
}

/// Class for implement IncrementorProtocol
class Incrementor {
    public enum IncrementorError: Error {
        /// Error when try to set maximum value less than zero
        case maxValueLessZero
    }
    
    /// Current value of Incrementor
    private var value: Int = 0
    
    /// Maximum value of Incrementor
    private(set) var maximumValue: Int = Int.max
}

extension Incrementor: IncrementorProtocol {
    /// Current value of Incrementor
    /// Default value: 0
    /// Can not be more than maximum value
    /// - returns: current value of Incrementor (Int)
    ///
    func getNumber() -> Int {
        return self.value
    }
    
    /// Increment value of Incrementor by 1
    /// If value reaches maximum value of Incrementor, value resets to 0
    func incrementNumber() {
        self.value = self.value + 1
        if self.value >= self.maximumValue {
            self.value = 0
        }
    }
    
    /// Sets maximum value of Incrementor
    /// Default value: Int.max
    /// - parameters:
    ///   - maximumValue: 'Int' maximum value of Incrementor
    /// - throws:
    /// - .maxValueLessZero 'IncrementorError' if parameter maxValue less than zero
    func set(maximumValue: Int) throws {
        guard maximumValue >= 0 else {
            throw IncrementorError.maxValueLessZero
        }
        self.maximumValue = maximumValue
        if self.value > self.maximumValue {
            self.value = 0
        }
    }    
}
