//
//  ContactController.swift
//  ContactsCloudKitChallenge
//
//  Created by Clay Mills on 3/10/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//


// Set up to call all cloudkit functions, then go set up View Controllers Last

//shared instance
//call model
//call cloudkitmanager so funcs work
//create func for contact info
//call createsave func records
//call refreshfetch func records

import Foundation

class ContactController {
    
    var contacts: [Contact] = []
    
    //shared
    static let shared = ContactController()
    
    //cloudkitmng
    private let cloudKitManager = CloudKitManager()
    
    init() {
        refreshData()
        
        
        func create(contact: Contact, completion: @escaping((error?)-> Void) = {_ in}) {
            let record = contact.cloudKitRecord
            cloudKitManager.save(record: record) { (error) in
                if let error = error {
                    completion()
                }
                self.contacts.append(contact)
            }
            func refreshData(completion: @escaping ((Error?) ->Void) = {_ in}) {
                cloudKitManager.fetchRecord(type: Contact.nameKey) { (_, error) in
                    if let error = error {
                        completion()
                        return
                    }
                    guard let record = records else {return}
                    self.contacts = record.flatmap{Contact(cloudKitRecord: $0)}
            }
            completion()
        }
    }
}
}
