//
//  account.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/5/6.
//  Copyright © 2018年 alltop. All rights reserved.
//

import Foundation
import UIKit

class account: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var clientName: UILabel!
    @IBOutlet weak var accountView: UIView!
    
    var cellText : [String] = ["會員專區","最新消息","行銷活動","常見問題Q & A","購物流程","付款流程","配送範圍","需要幫忙？"]
    
    var cellColor = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell", for: indexPath) as! accountCell
        
        if cellColor == 0 {
            cell.backgroundColor = UIColor(red: 255.0/255.0, green: 238.0/255.0, blue: 193.0/255.0, alpha: 1.0)
            
            cellColor = 1
        } else if cellColor == 1 {
            cell.backgroundColor = UIColor(red: 255.0/255.0, green: 252.0/255.0, blue: 215.0/255.0, alpha: 1.0)
            
            cellColor = 0
        }
        
        cell.accountLabel.text = cellText[indexPath.row]
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
