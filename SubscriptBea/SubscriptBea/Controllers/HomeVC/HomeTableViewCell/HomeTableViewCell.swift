//
//  HomeTableViewCell.swift
//  SubscriptBea
//
//  Created by Harshit on 27/11/21.
//  Copyright © 2021 Harshit Modi. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var vwBG: HMView!
    @IBOutlet weak var vwImage: HMView!
    @IBOutlet weak var imgTitle: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblDueDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    class func reuseIdentifier() -> String {
        return String(describing: self)
    }
    
    func configureCell(subscriptionData: Subscription) {
        self.lblTitle.text = subscriptionData.subscriptionTitle
        self.lblAmount.text = subscriptionData.subscriptionAmount
        self.lblDueDate.text = subscriptionData.subscriptionType
        
    }
    
}
