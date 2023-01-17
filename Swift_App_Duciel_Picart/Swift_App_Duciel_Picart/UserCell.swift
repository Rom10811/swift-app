//
//  UserCell.swift
//  Swift_App_Duciel_Picart
//
//  Created by etudiant on 17/01/2023.
//

import Foundation

import UIKit

class UserCell: UITableViewCell {
    // properties and methods here
    @IBOutlet weak var uidLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var pseudoLabel: UILabel!
    
    func configure(with user: User) {
        uidLabel.text = user.uid
        mailLabel.text = user.mail
        pseudoLabel.text = user.pseudo
    }
}
