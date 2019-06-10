//
//  ExpirableTokenTests.swift
//  NewtTests
//
//  Created by Tiago Bras on 10/06/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import XCTest
@testable import Newt

class ExpirableTokenTests: XCTestCase {
    private let tokenValue = "AwesomeToken"
    
    func test_expirableToken_tokenExpiresAfter3Seconds() {
        let e = expectation(description: #function)
        
        let token = Token(value: tokenValue, expiresIn: .seconds(3))
        
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(4)) {
            XCTAssertEqual(token.isExpired, true)
            
            e.fulfill()
        }
        
        wait(for: [e], timeout: 10)
    }
    
    func test_expirableToken_tokenDoesNotExpiresAfter3Seconds() {
        let e = expectation(description: #function)
        
        let token = Token(value: tokenValue, expiresIn: .seconds(6))
        
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(4)) {
            XCTAssertEqual(token.isExpired, false)
            
            e.fulfill()
        }
        
        wait(for: [e], timeout: 10)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
