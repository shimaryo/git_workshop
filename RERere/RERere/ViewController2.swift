//
//  ViewController.swift
//  RERere
//
//  Created by kosuke hanashiro on 2018/12/15.
//  Copyright © 2018 kosuke hanashiro. All rights reserved.
//

import UIKit
   
class ViewController2: UIViewController,UITableViewDelegate, UITableViewDataSource{
    var Goname :String = ""
    var Gotime :String = ""
    var array: Int = 0
    
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
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            List_name.remove(at: indexPath.row)
            List_time.remove(at: indexPath.row)
            countadd.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
 
    @IBAction func Add(_ sender: Any) {
        self.performSegue(withIdentifier: "GO", sender: nil)
    }
    /// セル選択時
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Goname=List_name[indexPath.row]
        Gotime=List_time[indexPath.row]
        array = indexPath.row
        performSegue(withIdentifier: "GoView", sender: nil)
    }
    
    // showlecture to set lectureName
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoView" {
            let VD = segue.destination as! Viewdata
            VD.Comename = Goname
            VD.Cometime = Gotime
            VD.array = array
        }
    }
    
}

