//
//  ProtectedViewController.swift
//  SwiftyLogin
//
//  Created by Gaurav Gupta on 6/6/16.
//  Copyright © 2016 Gaurav Gupta. All rights reserved.
//

import UIKit

class ProtectedViewController: UIViewController, AuthProtocol {
    
    @IBAction func logoutButtonPressed(sender: AnyObject) {
        let loginService = LoginService();
        loginService.logout(self)
        
    }
    
    func success() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window?.rootViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Login");


    }
    
    func error() {
        
    }
}
