
import UIKit

    var List_name = [String]()
    var List_time = [String]()
    var countadd = [Int]()
class ViewControllerAdd: UIViewController, UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var lecuture_name: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    let dataList = ["月1","月2","月3","月4","月5","月6","月7","火1","火2","火3","火4","火5","火6","火7","水1","水2","水3","水4","水5","水6","水7","木1","木2","木3","木4","木5","木6","木7","金1","金2","金3","金4","金5","金6","金7"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate設定
        pickerView.delegate = self
        pickerView.dataSource = self
        label.text = "月1"
        
        lecuture_name.text=""
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return dataList[row]
    }
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        label.text = dataList[row]
    }
    
    @IBAction func add(_ sender: Any) {
        self.performSegue(withIdentifier: "adddata", sender: nil)
        List_name.append(lecuture_name.text!)
        List_time.append(label.text!)
        countadd.append(0)
    }
}

