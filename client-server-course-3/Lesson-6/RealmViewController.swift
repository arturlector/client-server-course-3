//
//  RealmViewController.swift
//  client-server-course-3
//
//  Created by Artur Igberdin on 02.07.2021.
//

import UIKit
import RealmSwift


class RealmViewController: UIViewController {

   let databaseService = DatabaseService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = UserModel()
        user.name = "Alex2"
        user.age = 25
        user.pet = "Lucky2"
        user.gender = true
        user.cat = "Kitty2"
        user.car = "Lexus2"
        
        databaseService.add(user: user)
        
        let users1 = databaseService.read()
        
        databaseService.delete(user: user)
        
        let users2 = databaseService.read()
    }


}
