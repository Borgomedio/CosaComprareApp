//
//  ThirdViewController.swift
//  Cosa Comprare
//
//  Created by Andrea on 24/02/18.
//  Copyright © 2018 Andrea Borgotti. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    
    @IBOutlet weak var myTableView2: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list2[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete)
        {
            list2.remove(at: indexPath.row)
            myTableView2.reloadData()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        
        if let y = UserDefaults.standard.object(forKey: "listaCamprati") {
            list2 = (y as? [String])!
        }
        myTableView2.reloadData()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let y = UserDefaults.standard.object(forKey: "listaCamprati") {
            list2 = (y as? [String])!
        }
        myTableView2.reloadData()
    }
    
    @IBAction func button(_ sender: Any) {
        
        list2.removeAll()
        myTableView2.reloadData()
        UserDefaults.standard.set(list2, forKey: "listaCamprati")
        
    }
}
