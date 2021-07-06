//
//  FruitsViewController.swift
//  client-server-course-3
//
//  Created by Artur Igberdin on 17.06.2021.
//

import UIKit

protocol FruitsViewControllerDelegate: AnyObject {
    
    func fruitDidSelect(_ fruit: String)
}

class FruitsViewController: UITableViewController {
   
    weak var delegate: FruitsViewControllerDelegate?

    let fruits = ["Яблоко", "Авакадо", "Банан", "Киви"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let fruit = fruits[indexPath.row]
        
        delegate?.fruitDidSelect(fruit)
        
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = fruits[indexPath.row]
        return cell
    }


}
