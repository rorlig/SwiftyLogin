//
//  ViewController.swift
//  SwiftyLogin
//
//  Created by Gaurav Gupta on 6/5/16.
//  Copyright © 2016 Gaurav Gupta. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, AuthProtocol {

    @IBOutlet var emailTextField: UITextView!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark - handler login button press
    @IBAction func loginButtonPressed(sender: AnyObject) {
        print("loginButtonPressed")
        let loginService = LoginService();
        loginService.logIn(emailTextField!.text, password: passwordTextField!.text!, delegate: self)
    }
    
    // Mark - LoginProtocol Implementation
    func success() {
        print("success")
    }
    
    func error() {
        print("error")
        
    }


}

