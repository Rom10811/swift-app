//
//  MainController.swift
//  Swift_App_Duciel_Picart
//
//  Created by etudiant on 21/09/2022.
//

import UIKit
import FirebaseAuth

class SignInController: UIViewController {

    @IBOutlet weak var Mail: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var MsgError: UILabel!
    
    var user : Any!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show" {
            let controller = segue.destination as! MainController
            controller.user = self.user
        }
    }
    
    @IBAction func onClickSignInButton(_ sender: Any) {
        let email: String = Mail.text ?? ""
        let password: String = Password.text ?? ""
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            print(authResult ?? "authResult")
            print(error ?? "error")
            if (authResult != nil) {
                self?.MsgError?.isHidden = true
                self?.user = authResult?.user
                let mainController = self?.storyboard?.instantiateViewController(withIdentifier: "MainController") ?? MainController()
                self?.show(mainController, sender: nil)
            }
            else {
                self?.MsgError?.isHidden = false
            }
        }
    }
}
