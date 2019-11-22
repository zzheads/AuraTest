//
//  IntTestTests.swift
//  IntTestTests
//
//  Created by Алексей Папин on 31.10.2019.
//  Copyright © 2019 Алексей Папин. All rights reserved.
//

import XCTest
@testable import IntTest

class IntTestTests: XCTestCase {
    var incrementor = Incrementor()
    
    override func setUp() {
    }

    override func tearDown() {
    }

    func testIncrementing() {
        let maxValue = 35
        try! self.incrementor.set(maximumValue: maxValue)
        var i = 0
        while i < maxValue {
            self.incrementor.incrementNumber()
            i = i + 1
            if self.incrementor.getNumber() == 0 && i != 0 {
                break
            }
        }
        assert(i == maxValue, "Incorrect reset of value, expected in \(maxValue) iteration")
    }
    
    func testMaximumValue() {
        let maxValue = 10
        let count = 34
        try! self.incrementor.set(maximumValue: maxValue)
        (0..<count).forEach { _ in self.incrementor.incrementNumber() }
        assert(self.incrementor.maximumValue == maxValue, "Maximum value incorrect: \(self.incrementor.maximumValue), expected: \(maxValue)")
        assert(self.incrementor.getNumber() == count % maxValue, "Value incorrect, value: \(self.incrementor.getNumber()), expected: \(count % maxValue)")
    }

    func testNilMaximumValue() {
        try! self.incrementor.set(maximumValue: 0)
        (0..<10).forEach { _ in
            self.incrementor.incrementNumber()
            assert(self.incrementor.getNumber() == 0, "Value incorrect, value: \(self.incrementor.getNumber()), expected: 0")
        }
    }
    
    func testIncorrectMaximumValue() {
        do {
            try self.incrementor.set(maximumValue: -10)
        } catch {
            guard let incError = error as? Incrementor.IncrementorError else {
                assert(false, "Unknown error type: \(error)")
            }
            guard case .maxValueLessZero = incError else {
                assert(false, "Unknown error: \(incError)")
            }
        }
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }

}
