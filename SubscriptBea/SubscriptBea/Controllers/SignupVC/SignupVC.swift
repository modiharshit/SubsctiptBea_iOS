//
//  SignupVC.swift
//  SubscriptBea
//
//  Created by Harshit on 26/11/21.
//  Copyright © 2021 Harshit Modi. All rights reserved.
//

import UIKit

class SignupVC: HMBaseVC {

    //MARK:- Outlets
    @IBOutlet weak var txtFirstName: HMTextField!
    @IBOutlet weak var txtLastName: HMTextField!
    @IBOutlet weak var txtEmail: HMTextField!
    @IBOutlet weak var txtPassword: HMTextField!
    @IBOutlet weak var txtConfirmPassword: HMTextField!
    
    @IBOutlet weak var btnSignup: HMButton!
    
    //MARK:- Class Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    class func instantiate() -> SignupVC {
        return UIStoryboard.main().instantiateViewController(withIdentifier: SignupVC.identifier()) as! SignupVC
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.popVC()
    }
    
    
    @IBAction func btnSignupAction(_ sender: Any) {
    }
    
}
