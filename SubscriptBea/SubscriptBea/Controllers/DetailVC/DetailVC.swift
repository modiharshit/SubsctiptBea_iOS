//
//  DetailVC.swift
//  SubscriptBea
//
//  Created by Harshit on 26/11/21.
//  Copyright © 2021 Harshit Modi. All rights reserved.
//

import UIKit
import Firebase

class DetailVC: HMBaseVC {

    var user = User()
    var subscriptionData = Subscription()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.user = UserManager.sharedManager().activeUser
    }
    
    class func instantiate() -> DetailVC {
        return UIStoryboard.main().instantiateViewController(withIdentifier: DetailVC.identifier()) as! DetailVC
    }
    
    
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func btnSaveAction(_ sender: Any) {
        self.saveSubscription()
        HMMessage.showSuccessWithMessage(message: "Subscription added successfully")
        self.popVC()
    }
    
    @IBAction func btnDeleteSubscriptionAction(_ sender: Any) {
        self.deleteSubscription()
    }
    
}

extension DetailVC {
    func saveSubscription() {
        let timeStampId = Int(self.timestamp)
        self.ref.child("users").child(self.user.id!).child("subscriptions").child("\(timeStampId)").setValue([
            "id": "\(timeStampId)",
            "title" : "\(self.txtTitle.text!)"
            
        ])
    }
    
    func deleteSubscription() {
        if let id = self.subscriptionData.id {
            self.ref.child("users").child(self.user.id!).child("subscriptions").child(id).removeValue()
            
        }
        HMMessage.showSuccessWithMessage(message: "Deleted successfully")
        self.popVC()
    }
}
