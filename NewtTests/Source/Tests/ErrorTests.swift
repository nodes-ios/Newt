//
//  ErrorTests.swift
//  NewtTests
//
//  Created by Chris Combs on 03/06/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import XCTest
@testable import Newt

class ErrorTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func test_error_errorMessages() {
        NewtError.allValues.forEach { value in
            XCTAssertNotEqual(value.message, "", "Empty message value for error: \(value)")
        }
    }

}

extension NewtError {
    fileprivate static var allValues: [NewtError] = [
        .unknown, .nonTokenStored, .emptyToken, .storageDecodingError
    ]
}
