//
//  SignUpController.swift
//  Swift_App_Duciel_Picart
//
//  Created by etudiant on 21/09/2022.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

class SignUpController: UIViewController {

    @IBOutlet weak var Mail: UITextField!
    @IBOutlet weak var MsgError: UILabel!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Pseudonyme: UITextField!
    var db: Firestore!
    var localData: LocalData = LocalData.shared()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        db = Firestore.firestore()
    }
    
    @IBAction func onClickSignUpButton(_ sender: Any) {
        let email: String = Mail.text ?? ""
        let password: String = Password.text ?? ""
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (authResult, error) -> () in
            if (authResult != nil) {
                self?.MsgError.isHidden = true
                let pseudonyme = self?.Pseudonyme.text ?? ""
                let user = User(uid: authResult?.user.uid ?? "", mail: email, pseudo: pseudonyme, convs: [])
                user.save()
                self?.localData.user = user
                let tabBarController = self?.storyboard?.instantiateViewController(withIdentifier: "TabBarController") ?? TabBarController()
                self?.show(tabBarController, sender: nil)
            }
            else {
                self?.MsgError.isHidden = false
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
