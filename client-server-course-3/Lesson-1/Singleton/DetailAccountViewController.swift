//
//  DetailAccountViewController.swift
//  client-server-course-3
//
//  Created by Artur Igberdin on 15.06.2021.
//

import UIKit

class DetailAccountViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cashLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = Account.shared.name
        cashLabel.text = "\(Account.shared.cash)"
        
    }
    

}
