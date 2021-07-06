//
//  ObjectNotifyViewController.swift
//  client-server-course-3
//
//  Created by Artur Igberdin on 06.07.2021.
//

import UIKit
import RealmSwift

class StepCounter: Object {
    @objc dynamic var steps = 0
}

class ObjectNotifyViewController: UIViewController {

    @IBOutlet weak var stepLabel: UILabel!
    
    let mainRealm = try! Realm()
    
    let stepCounter = StepCounter()
    
    var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try? mainRealm.write {
            mainRealm.add(stepCounter)
        }
        
        token = stepCounter.observe { [weak self] change in
        
            switch change {
            
                case .change(let properties):
                    print(properties.0)
                    print(properties.1)
                    print(properties)
                case .error(let error):
                    print("An error occurred: \(error)")
                case .deleted:
                    print("The object was deleted.")
           
            }
            
            guard let self = self else { return }
            self.stepLabel.text = "Steps: \(self.stepCounter.steps)"
        }
        
        
        
       

    }
    
    @IBAction func stepUpAction(_ sender: Any) {
        try? mainRealm.write{
            stepCounter.steps = stepCounter.steps + 1
        }
    }
    

}
