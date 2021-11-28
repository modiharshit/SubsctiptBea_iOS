//
//  DetailVC.swift
//  SubscriptBea
//
//  Created by Harshit on 26/11/21.
//  Copyright © 2021 Harshit Modi. All rights reserved.
//

import UIKit

class DetailVC: HMBaseVC {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var txtTitle: HMTextField!
    @IBOutlet weak var txtSubscriptionType: HMTextField!
    @IBOutlet weak var txtStartDate: HMTextField!
    @IBOutlet weak var txtAmount: HMTextField!
    
    @IBOutlet weak var btnSave: HMButton!
    @IBOutlet weak var btnDeleteSubscription: HMButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    class func instantiate() -> SignupVC {
        return UIStoryboard.main().instantiateViewController(withIdentifier: SignupVC.identifier()) as! SignupVC
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func btnSaveAction(_ sender: Any) {
    }
    
    @IBAction func btnDeleteSubscriptionAction(_ sender: Any) {
    }
    
    
}
