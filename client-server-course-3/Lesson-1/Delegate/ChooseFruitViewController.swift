//
//  ChooseFruitViewController.swift
//  client-server-course-3
//
//  Created by Artur Igberdin on 17.06.2021.
//

import UIKit

class ChooseFruitViewController: UIViewController, FruitsViewControllerDelegate {
    
    @IBOutlet weak var fruitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func chooseFruitAction(_ sender: Any) {
        
        let fruitsVC = FruitsViewController()
        
        //Делегирующий объект = FruitsViewController
        //Назначает делегатом self (тоесть объект ChooseFruitViewController)
        fruitsVC.delegate = self
        
        //let navVC = UINavigationController(rootViewController: fruitsVC)
        navigationController?.pushViewController(fruitsVC, animated: true)
        
        //performSegue(withIdentifier: "showFruitsSegue", sender: fruitsVC)
    }
    
    
    //MARK: - FruitsViewControllerDelegate
    func fruitDidSelect(_ fruit: String) {
        
        self.fruitLabel.text = fruit
    }
    
}
