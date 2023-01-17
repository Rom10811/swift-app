//
//  MainController.swift
//  Swift_App_Duciel_Picart
//
//  Created by etudiant on 22/09/2022.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ProfilController: UIViewController {

    @IBOutlet weak var pseudo: UILabel!
    @IBOutlet weak var email: UILabel!
    var db : Firestore!
    var localData: LocalData = LocalData.shared()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(localData.user?.mail)
        pseudo.text = localData.user?.pseudo
        email.text = localData.user?.mail
    }
    
    
    
    @IBAction func onClickSignOutButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
