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
                // Add a new document with a generated ID
                self?.db.collection("users").document(authResult?.user.uid ?? "").setData([
                    "pseudo": pseudonyme,
                    "mail": email,
                    "convs": []
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added")
                    }
                }
                //let mainController = self?.storyboard?.instantiateViewController(withIdentifier: "MainController") ?? MainController()
                let mainController = MainController()
                mainController.user = authResult?.user
                self?.show(mainController, sender: nil)
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
