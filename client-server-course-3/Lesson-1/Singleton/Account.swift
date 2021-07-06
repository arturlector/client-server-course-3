//
//  Account.swift
//  client-server-course-3
//
//  Created by Artur Igberdin on 15.06.2021.
//

import Foundation

final class Account {
    
    private init() {}
    
    static let shared = Account()
    
    var name: String = ""
    var cash: Int = 0
}
