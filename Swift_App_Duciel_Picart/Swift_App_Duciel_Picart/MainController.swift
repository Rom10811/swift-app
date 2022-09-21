//
//  MainController.swift
//  Swift_App_Duciel_Picart
//
//  Created by etudiant on 21/09/2022.
//

import UIKit
import FirebaseAuth

class MainController: UIViewController {

    @IBOutlet weak var Mail: UITextField!
    @IBOutlet weak var Password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onClickSignInButton(_ sender: Any) {
        let email: String = Mail.text ?? ""
        let password: String = Password.text ?? ""
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
          print(strongSelf)
        }
    }
}

