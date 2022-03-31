//
//  HomeVC.swift
//  SubscriptBea
//
//  Created by Harshit on 26/11/21.
//  Copyright © 2021 Harshit Modi. All rights reserved.
//

import UIKit
import Firebase
import ObjectMapper

class HomeVC: HMBaseVC, CAAnimationDelegate {

    //MARK:- OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var btnProfile: UIButton!
    
    @IBOutlet weak var btnPlus: UIButton!
    
    var user = User()
    var arrSubscriptions : [Subscription] = []
    
    var imgName = "1"
    
    //MARK:- CLASS METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCell()
        
        
    }
    
    fileprivate func setButtonWithAnimation() {
        let oldValue = self.btnPlus.frame.width/2
        let newButtonWidth: CGFloat = 60
        
        /* Do Animations */
        CATransaction.begin() //1
        CATransaction.setAnimationDuration(2.0) //2
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)) //3
        
        // View animations //4
        UIView.animate(withDuration: 1.0) {
            self.btnPlus.frame = CGRect(x: 0, y: 0, width: newButtonWidth, height: newButtonWidth)
            
        }
        
        // Layer animations
        let cornerAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius)) //5
        cornerAnimation.fromValue = oldValue //6
        cornerAnimation.toValue = newButtonWidth/2 //7
        
        btnPlus.layer.cornerRadius = newButtonWidth/2 //8
        btnPlus.layer.add(cornerAnimation, forKey: #keyPath(CALayer.cornerRadius)) //9
        
        CATransaction.commit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.user = UserManager.sharedManager().activeUser
        self.getSubscriptions()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.setButtonWithAnimation()
        }
        
    }
    
    class func instantiate() -> HomeVC {
        return UIStoryboard.main().instantiateViewController(withIdentifier: HomeVC.identifier()) as! HomeVC
    }
    
    func registerTableViewCell() {
        tableView.register(UINib(nibName: HomeTableViewCell.reuseIdentifier(), bundle: nil), forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier())
    }
    
    @IBAction func btnProfileAction(_ sender: Any) {
        let objProfileVC = ProfileVC.instantiate()
        self.push(vc: objProfileVC)
    }
    
    @IBAction func btnPlusAction(_ sender: Any) {
        let obj = DetailVC.instantiate()
        obj.isNew = true
        self.push(vc: obj)
    }
}

extension HomeVC {
    
    func getSubscriptions() {
        self.arrSubscriptions.removeAll()
        
        if let userID = self.user.id {
            let placeRef = self.ref.child("users").child(userID).child("subscriptions")
            
            placeRef.observeSingleEvent(of: .value, with: { snapshot in
                
                if snapshot.childrenCount > 0 {
                    for child in snapshot.children {
                        let snap = child as! DataSnapshot
                        let placeDict = snap.value as! [String: Any]
                        
                        if let subscription: Subscription = Mapper<Subscription>().map(JSON: placeDict) {
                            self.arrSubscriptions.append(subscription)
                        }
                    }
                    self.tableView.reloadWithAnimation()
                } else {
                    self.tableView.reloadWithAnimation()
                }
            })
        }
    }
}
