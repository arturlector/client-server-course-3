//
//  UserModel.swift
//  client-server-course-3
//
//  Created by Artur Igberdin on 02.07.2021.
//

import Foundation
import RealmSwift

@objcMembers
class UserModel: Object {
    
    dynamic var name = ""
    dynamic var age = 0
    dynamic var pet = ""
    dynamic var gender = false
    dynamic var cat = ""
    dynamic var car = ""
}
