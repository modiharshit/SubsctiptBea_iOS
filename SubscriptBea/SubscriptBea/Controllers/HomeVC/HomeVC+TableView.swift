//
//  HomeVC+TableView.swift
//  SubscriptBea
//
//  Created by Harshit on 27/11/21.
//  Copyright © 2021 Harshit Modi. All rights reserved.
//

import UIKit

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier()) as! HomeTableViewCell
        return cell
    }
    
    
}
