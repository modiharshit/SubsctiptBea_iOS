//
//  HMBaseVC.swift
//  SubscriptBea
//
//  Created by Harshit on 27/11/21.
//  Copyright © 2021 Harshit Modi. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications
import Foundation

class HMBaseVC: UIViewController {
    
    let ref = Database.database().reference()
    let timestamp = NSDate().timeIntervalSince1970
    
    
    
    class func identifier() -> String {
        return String(describing: self)
    }
    
    func push(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showAlertWithMessage(message: String){
        let  alertController = UIAlertController(title: applicationName(), message: message, preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                print("Handle Ok logic here")
            }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func scheduleNotification(title: String?, msg: String?) {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "\(title ?? "Notification")"
        content.body = "\(msg ?? "Notification")"
        content.categoryIdentifier = "daily_reminder"
        
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        center.add(request)
    }

}

extension UserDefaults {

    func valueExists(forKey key: String) -> Bool {
        return object(forKey: key) != nil
    }

}

extension UITableView {

    func reloadWithAnimation() {
        self.reloadData()
        let tableViewHeight = self.bounds.size.height
        let cells = self.visibleCells
        var delayCounter = 0
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        for cell in cells {
            UIView.animate(withDuration: 1.6, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
