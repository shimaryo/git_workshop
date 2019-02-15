//
//  ViewController.swift
//  RERere
//
//  Created by kosuke hanashiro on 2018/12/15.
//  Copyright © 2018 kosuke hanashiro. All rights reserved.
//

import UIKit
   
class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return List_name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        cell.textLabel!.text = List_name[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 35)
        
        return cell
        
    }
 
    @IBAction func Add(_ sender: Any) {
        self.performSegue(withIdentifier: "GO", sender: nil)
    }
    
    
    
}

