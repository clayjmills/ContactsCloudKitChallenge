//
//  ContactListTableViewController.swift
//  ContactsCloudKitChallenge
//
//  Created by Clay Mills on 3/10/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

//segue
//update views

import UIKit

class ContactListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ContactController.shared.contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let contact = ContactController.shared.contacts[indexPath.row]
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = "Phone number: \(contact.phoneNumber), Email: \(contact.email)"
        
        return cell
    }
    
    ////////////////////BLACK DIAMOND////////////////
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEditContact" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let contactDetailVC = segue.destination as? ContactDetailViewController else {return}
            
            let contact = ContactController.shared.contacts[indexPath.row]
            contactDetailVC.contact = contact 
            
        }
    }

}
