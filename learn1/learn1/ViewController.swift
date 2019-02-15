//
//  ViewController.swift
//  learn1
//
//
//  Copyright © 2019 Swift-Beginners. All rights reserved.
//
import UIKit
import UserNotifications
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var buttan: UIButton!
    @IBOutlet weak var label: UILabel!
    let userDefaults = UserDefaults.standard
    
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
    
    // 通知を作成
    @IBAction func setNotification(_ sender: Any) {
        // タイトル、本文、サウンド設定の保持
        let content = UNMutableNotificationContent()
        content.title = "設定された時間です"
        content.subtitle = "5秒経過しました"
        content.body = "なんか書いとけ"
        content.sound = UNNotificationSound.default
        
        // seconds後に起動するトリガーを保持
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        // 識別子とともに通知の表示内容とトリガーをrequestに内包する
        let request = UNNotificationRequest(identifier: "Timer", content: content, trigger: trigger)
        
        // UNUserNotificationCenterにrequestを加える
        let center = UNUserNotificationCenter.current()
        center.delegate = self as? UNUserNotificationCenterDelegate
        center.add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    var text1: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "todolist") != nil{
            todonakami = UserDefaults.standard.object(forKey: "todolist") as! [String]
        }
        //buttan.setTitle("+", for: .normal)
       // label.text = readData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func readData() -> String {
        let str: String = userDefaults.object(forKey:"lecture") as! String
        return str
    }
    // フォアグラウンドの場合でも通知を表示する
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
}
