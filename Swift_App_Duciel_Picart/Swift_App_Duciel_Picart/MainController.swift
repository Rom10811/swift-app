//
//  MainController.swift
//  Swift_App_Duciel_Picart
//
//  Created by etudiant on 21/09/2022.
//

import UIKit

class MainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onClickLaunchButton(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle:nil)
        let controller = story.instantiateViewController(withIdentifier: "SecondController") as! SecondController
        let navigation = UINavigationController(rootViewController: controller)
        self.view.addSubview(navigation.view)
        self.addChild(navigation)
        navigation.didMove(toParent: self)
    }
}

