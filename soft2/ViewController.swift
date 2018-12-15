//
//  ViewController.swift
//  sw
//
//  Created by ryo shimabukuro on 2018/12/05.
//  Copyright © 2018 ryo shimabukuro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var buttan: UIButton!
    @IBOutlet weak var label: UILabel!
    let userDefaults = UserDefaults.standard
    
    var text1: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        buttan.setTitle("+", for: .normal)
        label.text = readData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func buttan(_ sender: Any) {
    }
    
    func readData() -> String {
        let str: String = userDefaults.object(forKey:"lecture") as! String
        return str
    }
    
    
}

