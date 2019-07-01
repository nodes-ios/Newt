//
//  KeychainStorageTests.swift
//  NewtTests
//
//  Created by Tiago Bras on 10/06/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import XCTest
@testable import Newt

class KeychainStorageTests: XCTestCase {
    var storage: KeychainStorage!
    private let cacheKey = "testCacheKey"
    
    override func setUp() {
        storage = KeychainStorage()
    }
    
    override func tearDown() {
        storage = nil
    }
    
    func test_keychainStorage_loadsAndSetsTokenWithDifferentKeys() {
        do {
            try storage.set(value: Token(value: "testSettingValue"), forKey: cacheKey)
            _ = try storage.value(forKey: cacheKey + "123")
            
            XCTFail("Should not have gotten a token")
        } catch {
            guard let newtError = error as? NewtError else {
                return XCTFail("Should have returned an error of type NewtError")
            }
            
            XCTAssertEqual(newtError, NewtError.storageDecodingError)
        }
    }

    func test_keychainStorage_loadsAndSetsToken() {
        do {
            try storage.set(value: Token(value: "testSettingValue"), forKey: cacheKey)
            let token = try storage.value(forKey: cacheKey)
            XCTAssertEqual(token.value, "testSettingValue", "Incorrect value when loading token from keychain storage")
        } catch {
            XCTFail("Failed setting token from keychain storage")
        }
    }
}
