//
//  HMBaseVC.swift
//  SubscriptBea
//
//  Created by Harshit on 27/11/21.
//  Copyright © 2021 Harshit Modi. All rights reserved.
//

import UIKit

class HMBaseVC: UIViewController {
    
    var tableViews = UITableView()
    
    class func identifier() -> String {
        return String(describing: self)
    }
    
    func push(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
