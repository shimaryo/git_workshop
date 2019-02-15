//
//  ViewController.swift
//  learn1
//
//  Created by 玉城翔平 on 2019/02/10.
//  Copyright © 2019 Swift-Beginners. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todonakami.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todocell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "todocell",for: indexPath)
        todocell.textLabel!.text = todonakami[indexPath.row]
    
     return todocell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let index = indexPath.row
        todonakami.remove(at: index)
        tableView.reloadData()
         UserDefaults.standard.set(todonakami, forKey: "todolist")
    }
    
     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if UserDefaults.standard.object(forKey: "todolist") != nil{
            todonakami = UserDefaults.standard.object(forKey: "todolist") as! [String]
        }
    }
}

