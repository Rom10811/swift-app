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
    
    var localData: LocalData = LocalData.shared()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSignInButton(_ sender: Any) {
        let email: String = Mail.text ?? ""
        let password: String = Password.text ?? ""
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            print(authResult ?? "authResult")
            if (authResult != nil) {
                self?.MsgError?.isHidden = true
                print(authResult?.user.uid)
                self?.localData.user = User(uid: authResult?.user.uid ?? "")
                print(self?.localData.user?.mail)
                let tabBarController = self?.storyboard?.instantiateViewController(withIdentifier: "TabBarController") ?? TabBarController()
                self?.show(tabBarController, sender: nil)
            }
            else {
                self?.MsgError?.isHidden = false
            }
        }
    }
}
