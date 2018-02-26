//
//  FirstViewController.swift
//  Cosa Comprare
//
//  Created by Andrea on 24/02/18.
//  Copyright © 2018 Andrea Borgotti. All rights reserved.
//  prova! ahahah

import UIKit

var list : [String] = []
var list2 : [String] = []

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete)
        {
            list2.append(list[indexPath.row])
            list.remove(at: indexPath.row)
            
            UserDefaults.standard.set(list2, forKey: "listaCamprati")
            UserDefaults.standard.set(list, forKey: "listaDaCamprare")
            myTableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let y = UserDefaults.standard.object(forKey: "listaDaCamprare") {
            list2 = (y as? [String])!
        }
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let y = UserDefaults.standard.object(forKey: "listaDaCamprare") {
            list2 = (y as? [String])!
        }
        myTableView.reloadData()
    }
    
    
    
}
