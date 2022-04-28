//
//  PersonalViewController.swift
//  UBRateMyProfessor
//
//  Created by Joe Maiarana on 4/27/22.
//

import UIKit
import Parse

class PersonalViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    
    
    var professor: PFObject! 
    
    var posts:[PFObject] = []
    // still need to connect the tableview
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.Name!.text = (self.professor["name"] as! String)
        self.QualityNum!.text = String(self.professor["Quality_Rating"] as! Float)
        self.DifficultyNum!.text = String(self.professor["Difficulty_Rating"] as! Float)
        let posts = PFQuery(className: "posts")
        posts.limit = 20
        let name = self.Name!.text!
        posts.whereKey("name", equalTo: name)
        do {
            // Create audio player object
            //print(try query.findObjects())
            try self.posts = posts.findObjects()
                    
            // Play the sound

        }
        catch {
            // Couldn't create audio player object, log the error
            print("shit")
        }
        print(posts)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.configureItems()
        
        

        // Do any additional setup after loading the view.
    }
    
    private func configureItems(){
        title = "Professor"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(toAddPost))

        tableView.rowHeight = 175
        
    }
    
    @objc func toAddPost(){
        self.performSegue(withIdentifier: "ToAddPost", sender: nil)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var QualityNum: UILabel!
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var DifficultyNum: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCell(withIdentifier: "professorCell")*/
        //print(posts)
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalCell", for: indexPath) as! PersonalCell
        let post = self.posts[indexPath.row]
        let quality = String(post["Quality_Rating"] as! Float)
        cell.postQual!.text = quality
        let difficulty = String(post["Difficulty_Rating"] as! Float )
        cell.postDif!.text = difficulty
        let review = post["review"] as! String
        cell.review.text! = review
        //let cell = UITableViewCell()
    
        
        

        // Configure the cell...

        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    

}
