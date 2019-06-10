//
//  NewtTests.swift
//  NewtTests
//
//  Created by Chris Combs on 03/06/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import XCTest
@testable import Newt

class NewtTests: XCTestCase {
    
    var newt: Newt?
    let token = Token(value: "NewtTestToken")
    
    override func setUp() {
        newt = try? Newt(storageType: .userDefaults)
    }
    
    override func tearDown() {
        newt = nil
    }
    
    func test_newt_canInit() {
        do {
            let newt = try Newt(storageType: .userDefaults)
            XCTAssertEqual(newt.storageType, .userDefaults, "Storage type not set correctly")
        } catch {
            XCTFail("Could not initialize Newt: \(error)")
        }
    }
    
    func test_newt_canStoreAndRead() {
        guard let newt = newt else {
            XCTFail()
            return
        }
        do {
            try newt.store(token)
        } catch {
            XCTFail("Could not write to Newt: \(error)")
        }
        do {
           let token = try newt.readToken()
            XCTAssertEqual(token.value, "NewtTestToken", "Could not properly load Token")
        }  catch {
            XCTFail("Could not read from Newt: \(error)")
        }
    }
    
    
}
