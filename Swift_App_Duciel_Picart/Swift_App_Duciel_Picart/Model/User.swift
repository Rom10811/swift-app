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
    private static var convsProperty: String = "convs"
    
    
    private var _uid: String
    private var _mail: String
    private var _pseudo: String
    private var _convs: [String]
    
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
    var convs: [String] {
        get { return _convs }
    }
    
    init(uid: String, mail: String, pseudo: String, convs: [String]) {
        self._uid = uid
        self._mail = mail
        self._pseudo = pseudo
        self._convs = convs
        self.db = Firestore.firestore()
    }
    
    init(uid: String) {
        self.db = Firestore.firestore()
        self._uid = uid
        self._mail = ""
        self._pseudo = ""
        self._convs = []
        if (uid != "") {
            // TODO fetch firestore
        }
    }
    
    func save() -> Void {
        db.collection("users").document(_uid).setData([
            User.mailProperty: _mail,
            User.pseudoProperty: _pseudo,
            User.convsProperty: _convs
        ])
    }
}
