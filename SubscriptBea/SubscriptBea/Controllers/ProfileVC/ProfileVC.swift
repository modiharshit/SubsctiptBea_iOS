//
//  ProfileVC.swift
//  SubscriptBea
//
//  Created by Harshit on 26/11/21.
//  Copyright © 2021 Harshit Modi. All rights reserved.
//

import UIKit

class ProfileVC: HMBaseVC {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnProfileImage: UIButton!
    
    @IBOutlet weak var txtFirstName: HMTextField!
    @IBOutlet weak var txtLastName: HMTextField!
    @IBOutlet weak var txtEmail: HMTextField!
    
    @IBOutlet weak var lblTotalSubscriptions: UILabel!
    
    @IBOutlet weak var btnUpdateProfile: HMButton!
    @IBOutlet weak var btnLogout: HMButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    class func instantiate() -> ProfileVC {
        return UIStoryboard.main().instantiateViewController(withIdentifier: ProfileVC.identifier()) as! ProfileVC
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func btnProfileImageAction(_ sender: Any) {
    }
    
    @IBAction func btnUpdateProfileAction(_ sender: Any) {
    }
    
    @IBAction func btnLogoutAction(_ sender: Any) {
    }
}

