//
//  Contact+CloudKit.swift
//  ContactsCloudKitChallenge
//
//  Created by Clay Mills on 3/10/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//


// Set up File as an extension of Contact Model, then go set up CloudKitManger(helpers) third

//give key properties, add one for recordtype
//create failable init to take CKRecords from cloudkit and turn them into model objects
//Call initializer
// create computed property to take model objects, give them a CKRecord to go to cloudkit
//instatiate by giving recordType(name of the class which is Contact)
//Set the values of the record type(Contact)

import Foundation
import CloudKit

extension Contact {
    
    //Keys
    static let nameKey = "name"
    static let phoneNumberKey = "phoneNumber"
    static let emailKey = "email"
    static let contactRecordType = "Contact"
    
    //Failable
    init?(cloudKitRecord: CKRecord) {
        guard let name = cloudKitRecord[Contact.nameKey] as? String,
        let phoneNumber = cloudKitRecord[Contact.phoneNumberKey] as? String,
        let email = cloudKitRecord[Contact.emailKey] as? String,
            cloudKitRecord.recordType == Contact.contactRecordType else {return nil}
        
        //Initializer
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        
    }
    
    //computed property
    var cloudKitRecord: CKRecord {
    //instatiate
        let record = CKRecord(recordType: Contact.contactRecordType)
        //Set Values
        record[Contact.nameKey] = name as CKRecordValue
        record[Contact.phoneNumberKey] = phoneNumber as CKRecordValue?
        record[Contact.emailKey] = email as CKRecordValue?
        
        return record
    }
    
}
