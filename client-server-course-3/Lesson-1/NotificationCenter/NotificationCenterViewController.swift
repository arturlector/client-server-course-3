//
//  NotificationCenterViewController.swift
//  client-server-course-3
//
//  Created by Artur Igberdin on 15.06.2021.
//

import UIKit

let backgroundChangeColorNotification = Notification.Name("backgroundChangeColorNotification")

class NotificationCenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Подписка на уведомление для self - backgroundChangeColorNotification
        NotificationCenter.default.addObserver(self, selector: #selector(changeColor(notification:)), name: backgroundChangeColorNotification, object: nil)
       
    }
    
    @objc
    func changeColor(notification: Notification) {
        
        guard let color = notification.userInfo?["color"] as? UIColor else { return }
        
        view.backgroundColor = color
    }
    
    @IBAction func changeColorAction(_ sender: Any) {
        
        let color = UIColor.red
        //Отправка уведомления backgroundChangeColorNotification
        NotificationCenter.default.post(name: backgroundChangeColorNotification, object: nil, userInfo: ["color": color])
    }
    
    //Отписка от уведомлений для self - backgroundChangeColorNotification
    deinit {
        NotificationCenter.default.removeObserver(self, name: backgroundChangeColorNotification, object: nil)
    }
    

}
