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

class HomeVC: HMBaseVC {

    //MARK:- OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var btnProfile: UIButton!
    
    @IBOutlet weak var btnPlus: UIButton!
    
    var user = User()
    var arrSubscriptions : [Subscription] = []
    
    //MARK:- CLASS METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.user = UserManager.sharedManager().activeUser
        self.getSubscriptions()
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
                    self.tableView.reloadData()
                }
            })
        }
    }
}
