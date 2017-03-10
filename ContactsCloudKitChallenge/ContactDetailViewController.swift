//
//  ContactDetailViewController.swift
//  ContactsCloudKitChallenge
//
//  Created by Clay Mills on 3/10/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//


//outlets and actions
//Update views
//prop for contact

import UIKit

class ContactDetailViewController: UIViewController {
    
    private let cloudKitManager = CloudKitManager()
    
    var contact: Contact?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let contact = contact else {return}
        title = "\(contact.name)"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let contact = self.contact {
            contact.cloudKitRecord.setValue(nameTextField, forKey: Contact.nameKey)
            contact.cloudKitRecord.setValue(phoneTextField, forKey: Contact.phoneNumberKey)
            contact.cloudKitRecord.setValue(emailTextField, forKey: Contact.emailKey)
            
            let record = contact.cloudKitRecord
            cloudKitManager.save(record: record) { (error) in
                if let error = error {
                    return
                }
                
            }
            
        }
        func updateViews() {
            guard let contact = contact else {return}
            nameTextField.text = contact.name
            phoneTextField.text = contact.phoneNumber
            emailTextField.text = contact.email
        }
        
    }
}
