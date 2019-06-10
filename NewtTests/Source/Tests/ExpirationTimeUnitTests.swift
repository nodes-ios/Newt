//
//  ExpirationTimeUnitTests.swift
//  NewtTests
//
//  Created by Tiago Bras on 10/06/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import XCTest
@testable import Newt

class ExpirationTimeUnitTests: XCTestCase {
    func test_expirationTimeUnit_convertsMillisecondsToSecondsCorrectly() {
        XCTAssertEqual(ExpirationTimeUnit.milliseconds(5500).seconds, 5.5)
    }
    
    func test_expirationTimeUnit_convertsSecondsToSecondsCorrectly() {
        XCTAssertEqual(ExpirationTimeUnit.seconds(951).seconds, 951)
    }
    
    func test_expirationTimeUnit_convertsMinutesToSecondsCorrectly() {
        XCTAssertEqual(ExpirationTimeUnit.minutes(2.5).seconds, 150)
    }
    
    func test_expirationTimeUnit_convertsHoursToSecondsCorrectly() {
        XCTAssertEqual(ExpirationTimeUnit.hours(2).seconds, 7_200)
    }
    
    func test_expirationTimeUnit_convertsDaysToSecondsCorrectly() {
        XCTAssertEqual(ExpirationTimeUnit.days(1.6).seconds, 138_240)
    }

}
