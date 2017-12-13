///*
//  Users.swift
// */
//
//import Foundation
//import Firebase
//
//struct User {
//
//    let key: String
//    let email: String
//    let name: String
//    let ref: Database.database().reference()
//
//    init(snapshot: ) {
//        key = snapshot.key
//        let snapshotValue = snapshot.value as! [String: AnyObject]
//        name = snapshotValue["name"] as! String
//        email = snapshotValue["email"] as! String
//        ref = snapshot.ref
//    }
//
//    init(name: String, email: String, key: String) {
//        self.name = name
//        self.email = email
//        self.key = key
//        self.ref = nil
//    }
//
//    func toAnyObject() -> Any {
//        return [
//            "name": name,
//            "email": email,
//        ]
//    }
//}

