//
//  FirebaseData.swift
//  Swift_App_Duciel_Picart
//
//  Created by etudiant on 17/01/2023.
//

import Foundation
import FirebaseFirestore

class FirebaseData {
    let db = Firestore.firestore()
    var users = [User]()
    
    func getUsers(completion: @escaping ([User]) -> Void) {
            db.collection("users").getDocuments { (snapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    for document in snapshot!.documents {
                        let uid = document.get("uid") as! String
                        let mail = document.get("mail") as! String
                        let pseudo = document.get("pseudo") as! String
                        let user = User(uid: uid, mail: mail, pseudo: pseudo)
                        self.users.append(user)
                    }
                    completion(self.users)
                }
            }
        }
}
