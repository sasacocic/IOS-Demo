//
//  HelloWorldController.swift
//  IOS-Demo
//
//  Created by sasa cocic on 9/3/16.
//  Copyright © 2016 SasaCorp. All rights reserved.
//

import UIKit
import Firebase

class HelloWorldController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidAppear(animated: Bool) {
        if let user = FIRAuth.auth()?.currentUser {
            print("navigate somewhere else because a user is already signed in \(user.email!)")
            //sign them out. this is just for testing
            do {
                try FIRAuth.auth()?.signOut()
            } catch let signoutError as NSError {
                print("Error signing out: \(signoutError)")
            }
            return
        }
        else{
            print("NO ONE IS SIGNED IN GOOD!")
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signIn(user: FIRUser?) {
        
        performSegueWithIdentifier("HomePage", sender: nil)
        
        //then redirect them to the main page
    }
    @IBAction func signInTapped(sender: AnyObject) { //sender is never used in this method...
        let theUsername = username.text!
        let thePassword = username.text!
        FIRAuth.auth()!.signInWithEmail(theUsername, password: thePassword) { (user,error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.signIn(user) // if we get to here then the user has been signed in
        }
    }
    
    @IBAction func signUP() {
        //create the user and put them in the database
        let email = username.text!
        let password = username.text!
        FIRAuth.auth()?.createUserWithEmail(email, password: password) { (user,error) in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            print(user?.email!)
            self.signIn(user)
        }
        
    }

}
