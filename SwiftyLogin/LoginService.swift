//
//  LoginService.swift
//  SwiftyLogin
//
//  Created by Gaurav Gupta on 6/5/16.
//  Copyright © 2016 Gaurav Gupta. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import JWT

class LoginService {
    
    let url = "http://localhost:9000/api/"
    /**
     Function that logs the user in and stores the session token for later use
     **/
    func logIn(email: String, password: String, delegate: AuthProtocol) {
        
        let parameters = [
            "email": email, //email
            "password": password //password
        ]
        var statusCode: Int = 0
        Alamofire.request(.POST, "http://localhost:9000/auth/local", parameters: parameters, encoding: .JSON)
            .responseJSON { response in
                statusCode = (response.response?.statusCode)! //Gets HTTP status code, useful for debugging
                if let value: AnyObject = response.result.value {
                    //Handle the results as JSON
                    let post = JSON(value)
                    if let key = post["token"].string {
                        print("successful login " + key)
                        do {
                            let payload = try JWT.decode("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.2_8pWJfyPup0YwOXK7g9Dn0cF1E3pdn299t4hSeJy5w", algorithm: .HS256("secret"))
                            print(payload)
                        } catch {
                            print("Failed to decode JWT: \(error)")
                        }
                        
                        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
                        NSUserDefaults.standardUserDefaults().setValue(key, forKey: "accessKey")
                        NSUserDefaults.standardUserDefaults().synchronize();


                        delegate.success()
                        //At this point the user should have authenticated, store the session id and use it as you wish
                    } else {
                        print("error detected")
                        delegate.error()
                    }
                }
        }
    }
    
    /*
     * logs out the user
     */
    func logout(delegate: AuthProtocol) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn")
        delegate.success()
        
    }
}
