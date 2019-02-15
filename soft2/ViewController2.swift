//
//  ViewController2.swift
//  sw
//
//  Created by ryo shimabukuro on 2018/12/06.
//  Copyright © 2018 ryo shimabukuro. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var TextField2: UITextField!
    @IBOutlet weak var TextField3: UITextField!
    @IBOutlet weak var TextField4: UITextField!
    @IBOutlet weak var TextField5: UITextField!
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var lavel: UILabel!
    
    var testText: String = "入力してください"
    
    //インスタンス生成
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextField.delegate = self
        userDefaults.register(defaults: ["lecture": "入力してください"])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        testText = TextField.text!
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        saveData(str: testText)
        
        return true
    }
    // Do any additional setup after loading the view.
    
    
    func saveData(str: String){
        userDefaults.set(str, forKey:"lecture")
        userDefaults.synchronize()
    }
    
    @IBAction func bot(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func Save(_ sender: Any) {
        
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
