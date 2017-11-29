//
//  StudentModel.swift
//  StudentsList
//
//  Created by CS589 on 9/10/17.
//  Copyright © 2017 Monmouth University. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: AnyObject]

class Contacts {
    var contacts =  [JSONDictionary] ()
    static let sharedInstance = Contacts()
    
    private init() {
        readStudentJSONfile()
    }
    
    func readStudentJSONfile() {
        if let path = Bundle.main.path(forResource: "CompanyContacts", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                
                let jsonToDict = try JSONSerialization.jsonObject(with: jsonData as Data , options: .allowFragments) as? [JSONDictionary]
                
                
                contacts = jsonToDict!
                //  print (students)
                
                
            }
            catch {
                print ("error in decoding JSON file")
            }
            
        }
    }
    
    func getContactsList() -> [JSONDictionary]  {
        
        return self.contacts
}
}
