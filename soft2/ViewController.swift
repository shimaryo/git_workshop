//
//  ViewController.swift
//  sw
//
//  Created by ryo shimabukuro on 2018/12/05.
//  Copyright © 2018 ryo shimabukuro. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var buttan: UIButton!
    @IBOutlet weak var label: UILabel!
    let userDefaults = UserDefaults.standard
    
    // 通知を作成
    @IBAction func setNotification(_ sender: Any) {
        // タイトル、本文、サウンド設定の保持
        let content = UNMutableNotificationContent()
        content.title = "設定された時間です"
        content.subtitle = "5秒経過しました"
        content.body = "なんか書いとけ"
        content.sound = UNNotificationSound.default
        
        // seconds後に起動するトリガーを保持
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
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
    @IBAction func popup(_ sender: Any) {
    }
    @IBAction func pop(_ sender: Any) {
    }
    @IBAction func buttonClicked(_ sender: Any) {
    }

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
    // フォアグラウンドの場合でも通知を表示する
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
}

