//
//  DatabaseService.swift
//  client-server-course-3
//
//  Created by Artur Igberdin on 02.07.2021.
//

import Foundation
import RealmSwift

protocol DatabaseServiceProtocol {
    func add(user: UserModel)
    func read() -> [UserModel]
    func delete(user: UserModel)
}

class DatabaseService: DatabaseServiceProtocol {
    
    let config = Realm.Configuration(schemaVersion: 4)
    lazy var realm = try! Realm(configuration: config)
    
    func add(user: UserModel) {
        
        do {
            self.realm.beginWrite()
            self.realm.add(user)
            try self.realm.commitWrite()
            print(realm.configuration.fileURL as Any)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func read() -> [UserModel] {
        
        let users = realm.objects(UserModel.self)
        users.forEach {
            print($0.name, $0.age, $0.car, $0.pet, $0.cat)
        }
        
        return Array(users)
    }
    
    func delete(user: UserModel) {
        
        do {
            self.realm.beginWrite()
            self.realm.delete(user)
            try self.realm.commitWrite()
            print(realm.configuration.fileURL as Any)
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
