//
//  ViewController.swift
//  client-server-course-3
//
//  Created by Artur Igberdin on 15.06.2021.
//

import UIKit

class AccountViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func sendCashAction(_ sender: Any) {
        
        guard let cashString = cashTextField.text, let cash = Int(cashString) else { return }
        
        Account.shared.name = nameTextField.text ?? ""
        Account.shared.cash = cash
    }
    

}

