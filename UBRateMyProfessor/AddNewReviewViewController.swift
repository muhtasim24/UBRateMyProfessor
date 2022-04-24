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
    //var subjects = ["331","250", "220"]
    var subjects: [PFObject] = []
    //var profs = ["Hartlott" , "Blanton", "Alphonce"]
    var profs: [PFObject] = []
    //var combined = [[String]]()
    var combined = [[PFObject]]()
    var subjectToPass: String = ""
    var professorsToPass: String = ""
    var professor = PFObject(className: "professor")
    var Prquery = PFQuery(className: "professor")
    var ProfessorID : String = ""
    var subject = PFObject(className: "subject")
    var Subquery = PFQuery(className: "subject")
    var SubjectID : String = ""
    
    
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
        Prquery = PFQuery(className: "professor")
        //let array: [PFObject]
        do {
            // Create audio player object
            //print(try query.findObjects())
            try self.profs = Prquery.findObjects()
                    
            // Play the sound

        }
        catch {
            // Couldn't create audio player object, log the error
            print("shit")
        }
        
        Prquery.findObjectsInBackground{( professors, error) in
            if professors != nil {
                self.profs = professors!
            } else {
                print("Empty professors list")
            }            
            
        }
        self.profs = self.profs.sorted(by: { (Object1: PFObject,Object2:PFObject) -> Bool in return (Object1["name"] as! String) < (Object2["name"] as! String)})
        
        Subquery = PFQuery(className: "subject")
        do {
            // Create audio player object
            //print(try query.findObjects())
            try self.subjects = Subquery.findObjects()
                    
            // Play the sound

        }
        catch {
            // Couldn't create audio player object, log the error
            print("shit")
        }
        self.subjects = self.subjects.sorted(by: { (Object1: PFObject,Object2:PFObject) -> Bool in return (Object1["subject"] as! String) < (Object2["subject"] as! String)})
        
        Subquery.findObjectsInBackground{( subjects, error) in
            if subjects != nil {
                self.subjects = subjects!
            } else {
                print("Empty professors list")
            }
            
        }
        
        

        //print(query)
        //print(self.profs)
        pickerView.delegate = self
        pickerView.dataSource = self
        combined.append(self.profs)
        combined.append(self.subjects)
        //print(combined)
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
        } else if((self.boolProfText == false && self.boolSubText == true)){
            self.AddPostNewSubject()
        } else if((self.boolProfText == false && self.boolSubText == false)){
            self.AddNewPost()
        } else if((self.boolProfText == true && self.boolSubText == false)){
            self.AddPostNewProfessor()
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
        var selected:PFObject
        if row == combined[component].count {
            return "other"
        } else {
            if(component == 1 ){
                selected = combined[component][row]
                //print("printing")
                //print(selected)
                self.subject = selected
                let id = selected.objectId
                self.SubjectID = (id)!
                let subject = selected["subject"]
                return subject as? String
            } else {
                selected = combined[component][row]
                //print("printing")
                //print(selected)
                self.professor = selected
                let id = selected.objectId!
                print(id )
                self.ProfessorID = id
                let name = selected["name"]
                //print(name as! String)
                return name as? String
            }
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
        let post = PFObject(className: "posts")
        let professor = PFObject(className: "professor")
        let subject = PFObject(className: "subject")

        
        professor["name"] = self.professorsToPass
        professor["subjects"] = [self.subjectToPass]
        professor["Quality_Rating"] = Int(self.qualityRatingLabel.text!)
        professor["Difficulty_Rating"] = Int(self.difficultyRatingLabel.text!)
        professor["NumberOfRatings"] = 1
        professor["Raw_Difficulty_Rating"] = Int(self.difficultyRatingLabel.text!)
        professor["Raw_Quality_Rating"] = Int(self.qualityRatingLabel.text!)
        professor["reviews"] = [self.reviewTextView.text!]
        
        
        subject["subject"] = self.subjectToPass
        subject["professors"] = [self.professorsToPass]
        
        post["name"] = self.professorsToPass
        post["subject"] = self.subjectToPass
        post["Quality_Rating"] = Int(self.qualityRatingLabel.text!)
        post["Difficulty_Rating"] = Int(self.difficultyRatingLabel.text!)
        post["review"] = self.reviewTextView.text!
        professor.saveInBackground{(success , error) in
            if success{
                print("Saved")
            } else {
                print("Error Saving!")
            }
        }
        
        subject.saveInBackground{(success , error) in
            if success{
                print("Saved")
            } else {
                print("Error Saving!")
            }
        }
        
        post["owner"] = PFUser.current()!
        post.saveInBackground{(success , error) in
            if success{
                print("Saved")
            } else {
                print("Error Saving!")
            }
        }
        
    }
    
    private func AddPostNewSubject(){
        let professor = self.professor
        let subject = PFObject(className: "subject")
        var Subarr = professor["subjects"] as! Array<String>
        var Revarr = professor["reviews"] as! Array<String>
        print("professor ID = \(self.ProfessorID)")

        print(Prquery)
        print("working")
        print(professor)
        print(professor["name"] as! String)
        let post = PFObject(className: "posts")
        post["name"] = professor["name"]
        print(professor)
        post["subject"] = self.subjectToPass
        post["Quality_Rating"] = Int(self.qualityRatingLabel.text!)
        post["Difficulty_Rating"] = Int(self.difficultyRatingLabel.text!)
        post["review"] = self.reviewTextView.text!
        post["owner"] = PFUser.current()!
        post.saveInBackground{(success , error) in
            if success{
                print("Saved")
            } else {
                print("Error Saving!")
            }
        }
        
        Subarr.append(self.subjectToPass )
        let sortedSubs = Array(Set(Subarr))
        professor["subjects"] = sortedSubs
        
        let number = (professor["NumberOfRatings"] as! Int) + 1
        professor["NumberOfRatings"] = number
        let RawDif = (professor["Raw_Difficulty_Rating"] as! Int) + Int(self.difficultyRatingLabel.text!)!
        professor["Raw_Difficulty_Rating"] =  RawDif
        let RawQual = (professor["Raw_Quality_Rating"] as! Int) + Int(self.qualityRatingLabel.text!)!
        professor["Raw_Quality_Rating"] = RawQual
        professor["Quality_Rating"] = Float(RawQual)  / Float(number)
        professor["Difficulty_Rating"] = Float(RawDif) / Float(number)
        Revarr.append(self.reviewTextView.text!)
        professor["reviews"] = Revarr
        post["owner"] = PFUser.current()!
        post.saveInBackground{(success , error) in
            if success{
                print("Saved")
            } else {
                print("Error Saving!")
            }
        }
        professor.saveInBackground{(success , error) in
            if success{
                print("Saved")
            } else {
                print("Error Saving!")
            }
        }
        
        subject["subject"] = self.subjectToPass
        subject["professors"] = [professor["name"]]
        
        subject.saveInBackground{(success , error) in
            if success{
                print("Saved")
            } else {
                print("Error Saving!")
            }
        }
        
        
        
    }
    private func AddNewPost(){
        let professor = self.professor
        let subject = self.subject
        var Subarr = professor["subjects"] as! Array<String>
        var Revarr = professor["reviews"] as! Array<String>
        var Profarr = subject["professors"] as! Array<String>
       
        let post = PFObject(className: "posts")
        post["name"] = professor["name"]
        post["subject"] = subject["subject"]
        post["Quality_Rating"] = Int(self.qualityRatingLabel.text!)
        post["Difficulty_Rating"] = Int(self.difficultyRatingLabel.text!)
        post["review"] = self.reviewTextView.text!
        post["owner"] = PFUser.current()!
        
        post.saveInBackground{(success , error) in
            if success{
                print("Saved")
            } else {
                print("Error Saving!")
            }
        }
        
        Subarr.append(subject["subject"] as! String)
        let sortedSubs = Array(Set(Subarr))
        professor["subjects"] = sortedSubs
        
        let number = (professor["NumberOfRatings"] as! Int) + 1
        professor["NumberOfRatings"] = number
        let RawDif = (professor["Raw_Difficulty_Rating"] as! Int) + Int(self.difficultyRatingLabel.text!)!
        professor["Raw_Difficulty_Rating"] =  RawDif
        let RawQual = (professor["Raw_Quality_Rating"] as! Int) + Int(self.qualityRatingLabel.text!)!
        professor["Raw_Quality_Rating"] = RawQual
        Revarr.append(self.reviewTextView.text!)
        
        
        professor["Quality_Rating"] = Float(RawQual)  / Float(number)
        professor["Difficulty_Rating"] = Float(RawDif) / Float(number)
        
        professor["reviews"] = Revarr

        professor.saveInBackground{(success , error) in
            if success{
                print("Saved")
            } else {
                print("Error Saving!")
            }
        }

        Profarr.append(professor["name"] as! String)
        let sortedProfarr = Array(Set(Profarr))
        subject["professors"] = sortedProfarr
        subject.saveInBackground{(success , error) in
            if success{
                print("Saved")
            } else {
                print("Error Saving!")
            }
        }

        
    }
    
    private func AddPostNewProfessor(){
        let subject = self.subject
        let post = PFObject(className: "posts")
        let professor = PFObject(className: "professor")
        
        professor["name"] = self.professorsToPass
        professor["subjects"] = [self.subject["subject"]]
        professor["Quality_Rating"] = Int(self.qualityRatingLabel.text!)
        professor["Difficulty_Rating"] = Int(self.difficultyRatingLabel.text!)
        professor["NumberOfRatings"] = 1
        professor["Raw_Difficulty_Rating"] = Int(self.difficultyRatingLabel.text!)
        professor["Raw_Quality_Rating"] = Int(self.qualityRatingLabel.text!)
        professor["reviews"] = [self.reviewTextView.text!]
        
        professor.saveInBackground{(success , error) in
            if success{
                print("Saved")
            } else {
                print("Error Saving!")
            }
        }
        
        post["name"] = professor["name"]
        post["subject"] = subject["subject"]
        post["Quality_Rating"] = Int(self.qualityRatingLabel.text!)
        post["Difficulty_Rating"] = Int(self.difficultyRatingLabel.text!)
        post["review"] = self.reviewTextView.text!
        post["owner"] = PFUser.current()!
        
        post.saveInBackground{(success , error) in
            if success{
                print("Saved")
            } else {
                print("Error Saving!")
            }
        }
        
        var Profarr = subject["professors"] as! Array<String>
        Profarr.append(professor["name"] as! String)
        let sortedProfarr = Array(Set(Profarr))
        subject["professors"] = sortedProfarr
        subject.saveInBackground{(success , error) in
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
