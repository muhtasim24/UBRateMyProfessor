//
//  ProfessorsViewController.swift
//  UBRateMyProfessor
//
//  Created by Joe Maiarana on 4/13/22.
//

import UIKit
import Parse
class ProfessorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var profs = [PFObject]()
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "professor")
        query.includeKey("name")
        
        query.findObjectsInBackground{(profs,error) in
            if profs != nil{
                self.profs = profs!
                self.tableView.reloadData()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "professorCell") as! professorCell
        let prof = profs[indexPath.row]
        let professorName = prof["name"]
        let rating = prof["Overall_Rating"]
        let subjects = prof["subjects"]
        cell.professorName.text = professorName as? String
        cell.overallrating.text = rating as? String
        cell.subjectsList.text = subjects as? String
        
        return cell
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
