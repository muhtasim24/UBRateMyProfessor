//
//  ProfessorsTableViewController.swift
//  UBRateMyProfessor
//
//  Created by Joe Maiarana on 4/17/22.
//

import UIKit
import Parse

class ProfessorsTableViewController: UITableViewController {
    var professors :[PFObject] = []
    var Prquery = PFQuery(className: "professor")
    var refresher: UIRefreshControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refresher = UIRefreshControl()
        self.refresher.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        self.tableView.refreshControl = refresher
        tableView.insertSubview(refresher, at: 0)
        self.loadProfessors()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.refresh()
        
    }
    func run(after wait: TimeInterval, closure: @escaping () -> Void) {
        let queue = DispatchQueue.main
        queue.asyncAfter(deadline: DispatchTime.now() + wait, execute: closure)
    }
    func refresh() {
        run(after: 2) {
           self.refresher.endRefreshing()
        }
    }
    @objc func onRefresh() {
        self.loadProfessors()
        self.refresh()
        self.tableView.reloadData()
       
    }
    
    @objc private func loadProfessors(){
        self.configureItems()
        let Prquery = PFQuery(className: "professor")
        //let array: [PFObject]
        do {
            // Create audio player object
            //print(try query.findObjects())
            try self.professors = Prquery.findObjects()
                    
            // Play the sound

        }
        catch {
            // Couldn't create audio player object, log the error
            print("shit")
        }
        self.professors = self.professors.sorted(by: { (Object1: PFObject,Object2:PFObject) -> Bool in return (Object1["name"] as! String) < (Object2["name"] as! String)})
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonIte
        
    }

    // MARK: - Table view data source
    
    
    private func configureItems(){
        title = "Professors"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(toAddPost))
        let signOut = UIBarButtonItem(title: "Logout",style: .done, target: self, action: #selector(logoutUser))
        self.navigationItem.leftBarButtonItem = signOut
        tableView.rowHeight = 175
        
    }
    
    @objc func toAddPost(){
        self.performSegue(withIdentifier: "AddPost", sender: nil)
    }

    
    
    @objc func logoutUser(){
        PFUser.logOut()
        self.dismiss(animated: true, completion: nil)
        
        
    }

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.professors.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "professorCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "professorCell") as! professorCell
        let professor = self.professors[indexPath.row]
        let name = professor["name"] as! String
        cell.professorName!.text = name
        let quality = String(professor["Quality_Rating"] as! Float)
        cell.overallrating!.text = quality
        let difficulty = String(professor["Difficulty_Rating"] as! Float ) as! String
        cell.difficultyRating!.text = difficulty
        
        
        let subjects = professor["subjects"] as! Array<String>
        let subjectsString = subjects.joined(separator: ", ")
        cell.subjectsList!.text = subjectsString
        cell.subjectsList.layer.borderWidth = 1
        
        

        // Configure the cell...

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
