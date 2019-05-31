//
//  DefaultsStorage.swift
//  Newt
//
//  Created by Chris Combs on 31/05/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import Foundation

class DefaultsStorage {
    let defaults = UserDefaults.standard
}

extension DefaultsStorage: Storage {
    func value(forKey key: CacheKey) throws -> Token  {
        guard let value = defaults.value(forKey: key) as? Token else { throw NewtError.nonTokenStored }
        return value
    }
    
    func set(value: Token, forKey key: CacheKey) throws {
        defaults.set(value, forKey: key)
    }
}
