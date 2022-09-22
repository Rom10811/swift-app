//
//  LocalData.swift
//  Swift_App_Duciel_Picart
//
//  Created by etudiant on 22/09/2022.
//

import Foundation

class LocalData {
    private static var sharedLocalData: LocalData = {
        let localData = LocalData()
        
        return localData
    }()
    
    var user: Any?
    
    private init() {
        self.user = nil
    }
    
    class func shared() -> LocalData {
        return sharedLocalData
    }
}
