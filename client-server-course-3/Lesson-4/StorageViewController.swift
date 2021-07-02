//
//  StorageViewController.swift
//  client-server-course-3
//
//  Created by Artur Igberdin on 25.06.2021.
//

import UIKit
import SwiftKeychainWrapper
import RealmSwift

@objcMembers
class User: Object {
    dynamic var userId: String = ""
    dynamic var name: String = ""
}

class StorageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //useUserDefaults()
        
        //useKeychain()
        
        useRealm()
    }
    
    func useRealm() {
        
        let user = User()
        user.name = "Fin"
        user.userId = "12345689"
        
        let realm = try! Realm()
        
        try? realm.write{
            realm.add(user)
        }
        
        readUser()
    }
    
    func readUser() {
        
        do {
            let realm = try Realm()
            let users = realm.objects(User.self)
            
            print(users.map { $0.name })
            
        } catch  {
            print(error)
        }
    }
    
    func useKeychain() {
        
        let token = KeychainWrapper.standard.string(forKey: "vkToken")
        let pincode = KeychainWrapper.standard.string(forKey: "pincode")
        
        KeychainWrapper.standard.set("12345-adffd-qrwer-12314", forKey: "vkToken")
        KeychainWrapper.standard.set("12345", forKey: "pincode")
        
        print(token)
        print(pincode)
    }
    
    func useUserDefaults() {
        
        let token = UserDefaults.standard.string(forKey: "vkToken")
        let pincode = UserDefaults.standard.string(forKey: "pincode")
        
        UserDefaults.standard.setValue("12345-adffd-qrwer-12314", forKey: "vkToken")
        UserDefaults.standard.set("12345", forKey: "pincode")
        
        print(token)
        print(pincode)
    }


}
