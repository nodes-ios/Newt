//
//  Storage.swift
//  Newt
//
//  Created by Chris Combs on 31/05/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import Foundation

public typealias CacheKey = String

public protocol Storage {
    func value(forKey key: CacheKey) throws -> Token
    func set(value: Token, forKey key: CacheKey) throws
}

public enum StorageType {
    case userDefaults
}

enum Keys {
    static let tokenKey = "NewtTokenKey"
}
