

import Foundation
import FirebaseAuth
import FirebaseDatabase

let myUserLoggedInNotificationKey = "cs498.MidtermProject.userLoggedIn"
let myUserLoggedOutNotificationKey = "cs498.MidtermProject.userLoggedIn"

class UserModel {
    static let sharedInstance = UserModel ()
    var currentUsers: [String] = []
    
    var user: User!
    var currentUserRef: DatabaseReference?
    
    private init() {
    }
    

    
    func verifyLogin (email user: String, password pw: String, completionHandler: @escaping (_ sucess: Bool)  -> () ) {

        Auth.auth().signIn(withEmail: user, password: pw, completion: { (user, error) in
            if error == nil {
                print ("login successful")
//                self.getCurrentUserRef()
//                self.initCurrentUsers()
//                dcompletionHandler(true)
            }
            else {
                print ("login failed")
                print ((error?.localizedDescription)!)
                completionHandler (false)
            }
        })
        
    }
    
    func registerUser (email user: String, password pw: String, completionHandler: @escaping (_ success: Bool) -> ())
    {
        Auth.auth().createUser(withEmail: user,
                                   password: pw) { user, error in
                                    if error == nil {
                                        completionHandler(true)
                                    }
                                    else {
                                        completionHandler(false)
                                    }
        }
        
    
    }
    
    func logout () {
        do {
            try Auth.auth().signOut()
            print ("signed out")
            
        }
        catch {
            print ("error logging out")
        }
    }
    
//    func getCurrentUserRef () {
//
//        // add logged in user to online node.
//        // remove when disconnected - not 100% sure if this gets triggered on signOut above
//
//        let usersRef = Database.database().reference(withPath: "online")
//        Auth.auth().addStateDidChangeListener { auth, user in
//            guard let user = user else { return }
//            self.user = User(authData: user)
//            self.currentUserRef = usersRef.child(self.user.uid)
//            self.currentUserRef?.setValue(self.user.email)
//            self.currentUserRef?.onDisconnectRemoveValue()
//        }
//    }
    
    func reset () {
        currentUsers.removeAll()
    }
    
    func initCurrentUsers () {
        let usersRef = Database.database().reference(withPath: "online")
        reset()
        
        // observers for online users node in firebase state changes
        
        usersRef.observe(.childAdded, with: { snap in
            guard let email = snap.value as? String else { return }
            self.currentUsers.append(email)
            print (self.currentUsers)
            NotificationCenter.default.post(name: Notification.Name(rawValue: myUserLoggedInNotificationKey), object: self)
        })
        
        usersRef.observe(.childRemoved, with: { snap in
            guard let emailToFind = snap.value as? String else { return }
            for (index, email) in self.currentUsers.enumerated() {
                if email == emailToFind {
                    print ("removed user node k/v pair")
                    self.currentUsers.remove(at: index)
                    print (self.currentUsers)
                    NotificationCenter.default.post(name: Notification.Name(rawValue: myUserLoggedOutNotificationKey), object: self)
                }
            }
        })
        
    }
}
