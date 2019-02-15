//
//  Viewdata.swift
//  RERere
//
//  Created by kosuke hanashiro on 2019/02/12.
//  Copyright © 2019 kosuke hanashiro. All rights reserved.
//

import UIKit
import UserNotifications
class Viewdata :UIViewController{
    
    
    var Comename : String = ""
    var Cometime : String = ""
    var count = 0
    var array = 0 // 選択した配列の要素番号
    let Image0 = UIImage(named: "0")!
    let Image1 = UIImage(named: "1")!
    let Image2 = UIImage(named: "2")!
    let Image3 = UIImage(named: "3")!
    let Image4 = UIImage(named: "4")!
    let Image5 = UIImage(named: "5")!
    let Image6 = UIImage(named: "6")!
    let Image7 = UIImage(named: "7")!
    let Image8 = UIImage(named: "8")!
    let Image9 = UIImage(named: "9")!
    let Image10 = UIImage(named: "10")!
    let Image11 = UIImage(named: "11")!
    let Image12 = UIImage(named: "12")!
    let Image13 = UIImage(named: "13")!
    let Image14 = UIImage(named: "14")!
    let Image15 = UIImage(named: "15")!

    @IBOutlet weak var retime: UILabel!
    @IBOutlet weak var rename: UILabel!
    @IBOutlet weak var yokobar: UIImageView!
    @IBOutlet weak var Counter: UILabel!
    
    override func viewDidLoad(){
        
        Counter.text! = String(countadd[array])
        show()
        super.viewDidLoad()
        
    }
    @IBAction func Add(_ sender: Any) {
        if countadd[array] < 15{
            countadd[array] += 1
            Counter.text! = String(countadd[array])
            imageoutput()
        }
        
    }
    // 通知を作成
    @IBAction func setNotification(_ sender: Any) {
        // タイトル、本文、サウンド設定の保持
        let content = UNMutableNotificationContent()
        content.title = "出席しましたか？"
        content.subtitle = "タップしてください"
        //content.body = "なんか書いとけ"
        content.sound = UNNotificationSound.default
        
        // seconds後に起動するトリガーを保持
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60*60*24*7 - 60, repeats: false)
        
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
    @IBAction func Sub(_ sender: Any) {
        if countadd[array] > 0{
            countadd[array] -= 1
            Counter.text! = String(countadd[array])
            imageoutput()
        }
    }
    
    func show(){
        retime.text = Cometime
        rename.text = Comename
        Counter.text! = String(countadd[array])
        Counter.text! = String(countadd[array])
        imageoutput()
    }
    func imageoutput(){
        switch countadd[array]{
        case 1:
            yokobar.image = Image1
            break
        case 2:
            yokobar.image = Image2
            break
        case 3:
            yokobar.image = Image3
            break
        case 4:
            yokobar.image = Image4
            break
        case 5:
            yokobar.image = Image5
            break
        case 6:
            yokobar.image = Image6
            break
        case 7:
            yokobar.image = Image7
            break
        case 8:
            yokobar.image = Image8
            break
        case 9:
            yokobar.image = Image9
            break
        case 10:
            yokobar.image = Image10
            break
        case 11:
            yokobar.image = Image11
            break
        case 12:
            yokobar.image = Image12
            break
        case 13:
            yokobar.image = Image13
            break
        case 14:
            yokobar.image = Image14
            break
        case 15:
            yokobar.image = Image15
            break
        default:
            yokobar.image = Image0
        }
        
    }
    // フォアグラウンドの場合でも通知を表示する
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
  
    
    
}
