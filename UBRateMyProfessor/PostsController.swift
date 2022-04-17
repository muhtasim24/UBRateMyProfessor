//
//  PostsController.swift
//  UBRateMyProfessor
//
//  Created by Joe Maiarana on 4/12/22.
//

import UIKit
import Parse

class PostsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        

        // Do any additional setup after loading the view.
    }
    
    private func configureItems(){
        title = "Professors"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: nil)
        let signOut = UIBarButtonItem(title: "Logout",style: .done, target: self, action: #selector(logoutUser))
        self.navigationItem.leftBarButtonItem = signOut
        
    }

    
    
    @objc func logoutUser(){
        PFUser.logOut()
        self.dismiss(animated: true, completion: nil)
        
        
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
