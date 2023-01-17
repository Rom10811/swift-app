//
//  User.swift
//  Swift_App_Duciel_Picart
//
//  Created by etudiant on 22/09/2022.
//

import Foundation
import FirebaseFirestore

class User {
    private static var mailProperty: String = "mail"
    private static var pseudoProperty: String = "pseudo"
    private static var uidProperty: String = "uid"
    
    
    private var _uid: String
    private var _mail: String
    private var _pseudo: String
    
    private var db: Firestore
    
    var uid: String {
        get { return _uid }
    }
    var mail: String {
        get { return _mail }
    }
    var pseudo: String {
        get { return _pseudo }
    }
    
    init(uid: String, mail: String, pseudo: String) {
        self._uid = uid
        self._mail = mail
        self._pseudo = pseudo
        self.db = Firestore.firestore()
    }
    
    init(uid: String) {
        self.db = Firestore.firestore()
        self._uid = uid
        self._mail = ""
        self._pseudo = ""
        if (uid != "") {
            let userRef = db.collection("users").document(uid)
            userRef.getDocument{
                (document, error) in
                if let document = document, document.exists {
                    let data = document.data()
                    self._pseudo = document.get("pseudo") as! String
                    self._mail = document.get("mail") as! String
                }
            }
            // TODO fetch firese
        }
    }
    
    func save() -> Void {
        db.collection("users").document(_uid).setData([
            User.mailProperty: _mail,
            User.pseudoProperty: _pseudo,
            User.uidProperty: _uid
        ])
    }
}
