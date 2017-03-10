//
//  CloudKitManager.swift
//  ContactsCloudKitChallenge
//
//  Created by Clay Mills on 3/10/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

//Set up file then go set up Model Controllers fourth

//make public database
// this project needs two functions(save, fetch)
// add completions to each function, unless you can think of how to do it once per func(starts with D)
//when fetching make sure to create predicate and querey and then perform

import Foundation
import CloudKit

class CloudKitManager {
    
    //public database
    let publicDataBase = CKContainer.default().publicCloudDatabase
    //funcs
    
    func save(record: CKRecord, completion: @escaping((Error?)-> Void) = {_ in}) {
        publicDataBase.save(record) { (_, error) in
            if let error = error {
                completion(error)
                return
            }
        }
    }
    
    func fetchRecord(type: String, completion: @escaping(Error?)-> Void) {
        //predicate
        let predicate = NSPredicate(value: true)
        
        //Query
        let query = CKQuery(recordType: type, predicate: predicate)
        
        publicDataBase.perform(query, inZoneWith: nil) { (returnedRecords, error) in
            if let error = error {
                completion(error)
                return
            }
            guard let record = returnedRecords else {completion(error); return}
            completion(error)
        }
    }
}
