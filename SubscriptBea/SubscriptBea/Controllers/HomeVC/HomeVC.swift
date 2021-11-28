//
//  HomeVC.swift
//  SubscriptBea
//
//  Created by Harshit on 26/11/21.
//  Copyright © 2021 Harshit Modi. All rights reserved.
//

import UIKit

class HomeVC: HMBaseVC {

    //MARK:- OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var btnProfile: UIButton!
    
    @IBOutlet weak var btnPlus: UIButton!
    
    //MARK:- CLASS METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCell()
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
        self.push(vc: obj)
    }
}
