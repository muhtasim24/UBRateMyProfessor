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
    var subjectsList = [PFObject]()
    var profsList = [PFObject]()
    //var subjects = ["331","250", "220"]
    var subjects: [PFObject] = []
    //var profs = ["Hartlott" , "Blanton", "Alphonce"]
    var profs: [PFObject] = []
    //var combined = [[String]]()
    var combined = [[PFObject]]()
    var subjectToPass: String = ""
    var professorsToPass: String = ""
    
    
    var boolProfText : Bool = false
    var boolSubText : Bool = false
    
    @IBOutlet weak var professorLabel: UILabel!
    @IBOutlet weak var professortextField: UITextField!
    @IBOutlet weak var subjectNumberTextField: UITextField!
    @IBOutlet weak var subjectNumberLabel: UILabel!
    @IBOutlet weak var reviewTextView: UITextView!

    @IBOutlet weak var difficultyRatingLabel: UILabel!
    @IBOutlet weak var qualityRatingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let query = PFQuery(className: "professor")
        query.includeKey("name")
        query.findObjectsInBackground{( professors, error) in
            if professors != nil {
                self.profs = professors!
            } else {
                print("Empty professors list")
            }            
            
        }
        print(self.profs)
        pickerView.delegate = self
        pickerView.dataSource = self
        combined.append(self.profs)
        combined.append(self.subjects)
        print(combined)
        self.configureItems()
        
        // Do any additional setup after loading the view.
    }
    private func configureItems(){
        title = "New Review"
        reviewTextView!.layer.borderWidth = 1
        let submitButton = UIBarButtonItem(title: "Submit",style: .done, target: self, action: #selector(toSubmit))
        self.navigationItem.rightBarButtonItem = submitButton
        self.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
        self.pickerView(pickerView, didSelectRow: 0, inComponent: 1)
    }
    @IBAction func difficultyStepper(_ sender: UIStepper) {
        self.difficultyRatingLabel.text = String(Int(sender.value))
    }
    
    @IBAction func qualityStepper(_ sender: UIStepper) {
        self.qualityRatingLabel.text = String(Int(sender.value))
    }
    @objc func toSubmit(){
        if self.boolProfText == true {
            self.professorsToPass = self.professortextField.text ?? ""
        }
        if self.boolSubText == true {
            self.subjectToPass  = self.subjectNumberTextField.text ?? ""
        }
        
        
        
        
        let qualrating:String = self.qualityRatingLabel.text!
        let difrating: String = self.difficultyRatingLabel.text!
        
        if (self.boolProfText == true && self.boolSubText == true) {
            self.AddNewProfessorAndSubject()
        }
                
        print("Submited: \(self.professorsToPass)... \(self.subjectToPass) ... \(qualrating)...\(difrating)... \(self.reviewTextView.text!)")
        //self.performSegue(withIdentifier: "AddPost", sender: nil)
        //self.dismiss(animated: true, completion: nil)
        _ = navigationController?.popViewController(animated: true)
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
                self.boolProfText = true
                //self.subjectToPass  = self.professortextField.text ?? ""
            }
            if component == 1{
                self.subjectNumberLabel.isHidden = false
                self.subjectNumberTextField.isHidden = false
                self.boolSubText = true
                //self.subjectToPass  = self.subjectNumberTextField.text ?? ""
                
                
            }
        } else{
            if component == 0 {
                self.boolProfText = false
                self.professorLabel.isHidden = true
                self.professortextField.isHidden = true
                self.professorsToPass  = combined[component][row]["name"] as! String
            }
            if component == 1{
                self.boolSubText = false
                self.subjectNumberLabel.isHidden = true
                self.subjectNumberTextField.isHidden = true
                self.subjectToPass  = combined[component][row]["subject"] as! String
            }
        }
                
    }
    
    private func AddNewProfessorAndSubject(){
        let profObj = PFObject(className: "professor")
        profObj["name"] = self.professorsToPass
        profObj["subject"] = self.subjectToPass
        profObj["Quality_Rating"] = Int(self.qualityRatingLabel.text!)
        profObj["Difficulty_Rating"] = Int(self.difficultyRatingLabel.text!)
        profObj["reviews"] = self.reviewTextView.text!
        profObj["NumberOfRatings"] = 1
        //profObj["Raw_Difficulty_Rating"] = Int(self.difficultyRatingLabel.text!)
        //profObj["Raw_Quality_Rating"] = Int(self.qualityRatingLabel.text!)
        let subObj = PFObject(className: "subject")
        subObj["Subjects"] = self.subjectToPass
        subObj["professor"] = self.professorsToPass
        //profObj["owner"] = PFUser.current()!
        profObj.saveInBackground{(success , error) in
            if success{
                print("Saved")
            } else {
                print("Error Saving!")
            }
        }
        //subObj["owner"] = PFUser.current()!
        subObj.saveInBackground{(success , error) in
            if success{
                print("Saved")
                
            } else {
                print("Error Saving!")
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
