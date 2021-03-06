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
    var isNew : Bool = false
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var txtTitle: HMTextField!
    @IBOutlet weak var txtSubscriptionType: HMTextField!
    @IBOutlet weak var txtStartDate: HMTextField!
    @IBOutlet weak var txtAmount: HMTextField!
    
    @IBOutlet weak var btnSave: HMButton!
    @IBOutlet weak var btnDeleteSubscription: HMButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.isNew {
            self.lblTitle.text = "Add Subscription"
            self.btnDeleteSubscription.isHidden = true
            self.btnSave.setTitle("Save", for: .normal)
        } else {
            self.lblTitle.text = "Update Subscription"
            self.btnDeleteSubscription.isHidden = false
            self.btnSave.setTitle("Update", for: .normal)
            self.loadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.user = UserManager.sharedManager().activeUser
    }
    
    class func instantiate() -> DetailVC {
        return UIStoryboard.main().instantiateViewController(withIdentifier: DetailVC.identifier()) as! DetailVC
    }
    
    func loadData() {
        self.txtTitle.text = self.subscriptionData.subscriptionTitle
    }
    
    func showDeleteConfirmation() {
        
        let alert = UIAlertController(title: "Delete", message: kAreYouSureToDeleteSubscription, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { (_) in
            self.deleteSubscription()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func btnSaveAction(_ sender: Any) {
        if self.isNew {
            self.saveSubscription()
        } else {
            self.updateSubscription()
        }
        
        HMMessage.showSuccessWithMessage(message: self.isNew ? "Subscription Added successfully" : "Updated Successfully")
        self.popVC()
    }
    
    @IBAction func btnDeleteSubscriptionAction(_ sender: Any) {
        self.showDeleteConfirmation()
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
        if let id = self.subscriptionData.id, let userId = self.user.id {
            self.ref.child("users").child(userId).child("subscriptions").child(id).removeValue()
            
        }
        HMMessage.showSuccessWithMessage(message: "Deleted successfully")
        self.popVC()
    }
    
    func updateSubscription() {
        if let userId = self.user.id, let id = self.subscriptionData.id {
            self.ref.child("users").child(userId).child("subscriptions").child(id).updateChildValues([
                "title" : self.txtTitle.text!,
                
            ])
            
            HMMessage.showSuccessWithMessage(message: "Profile updated successfully.")
        }
        
    }
}
