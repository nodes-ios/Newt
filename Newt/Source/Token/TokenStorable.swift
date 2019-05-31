//
//  TokenStorable.swift
//  Newt
//
//  Created by Chris Combs on 31/05/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import Foundation

public protocol TokenStorable {
    func store(_ token: Token) throws
}
