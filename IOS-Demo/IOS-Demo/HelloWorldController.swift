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
            print("navigate somewhere else because a user is already signed in")
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
    
    @IBAction func signIn() {
        //sign user in....
        //then redirect them to the main page
    }
    
    @IBAction func signUP() {
        //create the user and put them in the database
    }

}
