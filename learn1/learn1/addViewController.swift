//
//  addViewController.swift
//  learn1
//
//  Created by 玉城翔平 on 2019/02/10.
//  Copyright © 2019 Swift-Beginners. All rights reserved.
//

import UIKit
var todonakami = [String]()
class addViewController: UIViewController {

    @IBOutlet weak var text: UITextField!
    @IBAction func add(_ sender: Any) {
        todonakami.append(text.text!)
        text.text = ""
        UserDefaults.standard.set(todonakami, forKey: "todolist")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
