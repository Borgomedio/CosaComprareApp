//
//  SecondViewController.swift
//  Cosa Comprare
//
//  Created by Andrea on 24/02/18.
//  Copyright © 2018 Andrea Borgotti. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func addObject(_ sender: Any) {
        if(textField.text != ""){
            list.append(textField.text!)
            textField.text = ""
        }
        UserDefaults.standard.set(list, forKey: "listaDaCamprare")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    //toglie la tastiera when user click outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

