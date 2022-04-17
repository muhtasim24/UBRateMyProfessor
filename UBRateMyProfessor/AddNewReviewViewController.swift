//
//  AddNewReviewViewController.swift
//  UBRateMyProfessor
//
//  Created by Winston Peng on 4/13/22.
//

import UIKit
import Parse

class AddNewReviewViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    //var subjects = [PFObject]()
    var subjects = ["331","250", "220"]
    var profs = ["Hartlott" , "Blanton", "Alphonce"]
    var combined = [[String]]()
    
    @IBOutlet weak var professorLabel: UILabel!
    @IBOutlet weak var professortextField: UITextField!
    @IBOutlet weak var subjectNumberTextField: UITextField!
    @IBOutlet weak var subjectNumberLabel: UILabel!
    @IBOutlet weak var reviewTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureItems()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        combined.append(self.profs)
        combined.append(self.subjects)
        // Do any additional setup after loading the view.
    }
    private func configureItems(){
        title = "New Review"
        reviewTextView!.layer.borderWidth = 1
        
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return combined.count
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return combined[component].count + 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == combined[component].count {
            return "other"
        } else {
            return "\(combined[component][row])"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == combined[component].count {
            if component == 0 {
                    self.professorLabel.isHidden = false
                self.professortextField.isHidden = false
            }
            if component == 1{
                self.subjectNumberLabel.isHidden = false
                self.subjectNumberTextField.isHidden = false
            }
        } else{
            if component == 0 {
                    self.professorLabel.isHidden = true
                self.professortextField.isHidden = true
            }
            if component == 1{
                self.subjectNumberLabel.isHidden = true
                self.subjectNumberTextField.isHidden = true
            }
        }
                
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
