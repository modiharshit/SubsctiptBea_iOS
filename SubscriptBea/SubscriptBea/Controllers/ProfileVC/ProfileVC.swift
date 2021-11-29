//
//  ProfileVC.swift
//  SubscriptBea
//
//  Created by Harshit on 26/11/21.
//  Copyright © 2021 Harshit Modi. All rights reserved.
//

import UIKit
import AVKit
import MobileCoreServices

class ProfileVC: HMBaseVC {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnProfileImage: UIButton!
    
    @IBOutlet weak var txtFirstName: HMTextField!
    @IBOutlet weak var txtLastName: HMTextField!
    @IBOutlet weak var txtEmail: HMTextField!
    
    @IBOutlet weak var lblTotalSubscriptions: UILabel!
    
    @IBOutlet weak var btnUpdateProfile: HMButton!
    @IBOutlet weak var btnLogout: HMButton!
    
    var user = User()
    var imagePicker = UIImagePickerController()
    
    var profileImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
    }
    
    class func instantiate() -> ProfileVC {
        return UIStoryboard.main().instantiateViewController(withIdentifier: ProfileVC.identifier()) as! ProfileVC
    }
    
    func loadData() {
        self.user = UserManager.sharedManager().activeUser
        
        self.txtFirstName.text = self.user.firstName
        self.txtLastName.text = self.user.lastName
        self.txtEmail.text = self.user.email
    }
    
    func updateUser() {
        if let userId = self.user.id, userId.count > 0 {
            self.ref.child("users").child(userId).setValue([
                "id": self.user.id,
                "firstName" : self.txtFirstName.text!,
                "lastName" : self.txtLastName.text!,
                "email" : self.user.email
            ])
            let user = User(id: self.user.id, firstName: self.txtFirstName.text, lastName: self.txtLastName.text, email: self.user.email, profilePicture: "")
            UserManager.sharedManager().activeUser = user
        }
        
    }
    
    func showLogoutConfirmation() {
        
        let alert = UIAlertController(title: "Logout", message: kAreYouSureToLogout, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Logout", style: .default, handler: { (_) in
            UserManager.sharedManager().logout()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func btnProfileImageAction(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Upload Photo", message: "Select an option", preferredStyle: .actionSheet)
                
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (_) in
            self.selectImage(sourceType: .camera)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (_) in
            self.selectImage(sourceType: .photoLibrary)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            
        }))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func btnUpdateProfileAction(_ sender: Any) {
        self.updateUser()
    }
    
    @IBAction func btnLogoutAction(_ sender: Any) {
        self.showLogoutConfirmation()
    }
}

extension ProfileVC :  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - UIImagePickerControllerDelegate
    
    func selectImage(sourceType: UIImagePickerController.SourceType) {
        imagePicker.modalPresentationStyle = .fullScreen
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.modalPresentationStyle = .fullScreen
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.profileImage = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        self.imgProfile.image = profileImage
        picker.dismiss(animated: true, completion: nil)
    }
}
