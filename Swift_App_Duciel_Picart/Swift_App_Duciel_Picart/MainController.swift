//
//  MainController.swift
//  Swift_App_Duciel_Picart
//
//  Created by etudiant on 22/09/2022.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class MainController: UIViewController {

    var db : Firestore!
    var user: Any? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        do {
            try Auth.auth().signOut()
            print("déconnexion!")
        }
        catch let signOutError as NSError {
            print("Error during SingOut: %@", signOutError)
        }
    }
    
    @IBAction func onClickSignOutButton(_ sender: Any) {
        self.dismiss(animated: true)
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
