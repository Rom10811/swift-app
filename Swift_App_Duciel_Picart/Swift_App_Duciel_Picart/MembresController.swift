//
//  MembresController.swift
//  Swift_App_Duciel_Picart
//
//  Created by etudiant on 17/01/2023.
//

import UIKit
import FirebaseFirestore

class MembresController: UITableViewController {
    let firebaseData = FirebaseData()
    var users : [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        firebaseData.getUsers() { users in
            self.users = users
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = users[indexPath.row].pseudo + " Informations"
        content.body = "Mail: " + users[indexPath.row].mail + "\n" + "Id: " + users[indexPath.row].uid
        content.sound = .default
        content.userInfo = ["value": "Data with local notification"]
        let fireDate = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: Date().addingTimeInterval(5))
        let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)
        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        center.add(request) { (error) in
        if error != nil {
            print("Error = \(error?.localizedDescription ?? "error local notification")")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.pseudo
        return cell
    }
}

