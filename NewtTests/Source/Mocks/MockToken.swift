//
//  MockToken.swift
//  NewtTests
//
//  Created by Chris Combs on 03/06/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import Foundation
@testable import Newt

struct MockToken: Token, Codable {
    let value: String
}
