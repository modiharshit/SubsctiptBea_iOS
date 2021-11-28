//
//  LoginVC.swift
//  SubscriptBea
//
//  Created by Harshit on 26/11/21.
//  Copyright © 2021 Harshit Modi. All rights reserved.
//

import UIKit

class LoginVC: HMBaseVC {

    //MARK:- OUTLETS
    @IBOutlet weak var txtEmail: HMTextField!
    @IBOutlet weak var txtPassword: HMTextField!
    
    @IBOutlet weak var btnLogin: HMButton!
    @IBOutlet weak var btnSignup: UIButton!
    
    //MARK:- CLASS METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    class func instantiate() -> LoginVC {
        return UIStoryboard.main().instantiateViewController(withIdentifier: LoginVC.identifier()) as! LoginVC
    }
    
    @IBAction func btnLoginAction(_ sender: Any) {
    }
    
    @IBAction func btnSignupAction(_ sender: Any) {
        let obj = SignupVC.instantiate()
        self.push(vc: obj)
    }
    
}
