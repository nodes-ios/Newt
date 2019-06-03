//
//  DefaultsStorageTests.swift
//  NewtTests
//
//  Created by Chris Combs on 03/06/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import XCTest
@testable import Newt

class DefaultsStorageTests: XCTestCase {
    var defaultsStorage: DefaultsStorage?
    private let cacheKey = "testCacheKey"
    
    override func setUp() {
        defaultsStorage = DefaultsStorage()
    }

    override func tearDown() {
        defaultsStorage = nil
    }

    func test_defaultsStorage_loadsAndSetsToken() {
        do {
            try defaultsStorage?.set(value: MockToken(value: "testSettingValue"), forKey: cacheKey)
            guard let token = try defaultsStorage?.value(forKey: cacheKey) as? MockToken else {
                XCTFail("Failed to load token from defaults as MockToken")
                return
            }
            XCTAssertEqual(token.value, "testSettingValue", "Incorrect value when loading token from defaults storage")
        } catch {
            XCTFail("Failed setting token from defaults storage")
        }
    }
    

}
