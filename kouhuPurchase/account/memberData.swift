//
//  memberData.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/6/5.
//  Copyright © 2018年 alltop. All rights reserved.
//

import Foundation
import UIKit

class memberData : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let labelContent : [String] = ["更改會員資料","歷史訂單查詢","折價金查詢","紅利點數查詢","收藏","使用者條款","隱私權條款","退出目前使用帳號"]
    
    override func viewDidLoad() {
        super .viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super .didReceiveMemoryWarning()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberDataCell", for: indexPath) as! memberDataCell
        
        cell.labelNext.text = labelContent[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "modifyData", sender: nil)
        }
        
    }
    
    
    
    
}

class memberDataCell : UITableViewCell {
    @IBOutlet weak var labelNext: UILabel!
}
