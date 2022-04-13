//
//  TodayViewController.swift
//  SubscriptBeaWidget
//
//  Created by Harshit on 26/02/22.
//  Copyright © 2022 Harshit Modi. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
 
    @IBAction func btnAddNewSubscriptionAction(_ sender: UIButton) {
        if let url = URL(string: "open://")
        {
            self.extensionContext?.open(url, completionHandler: nil)
        }
    }
    
}
