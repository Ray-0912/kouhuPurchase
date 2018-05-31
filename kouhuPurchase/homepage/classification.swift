//
//  classification.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/3/30.
//  Copyright © 2018年 alltop. All rights reserved.
//

import Foundation
import UIKit

class classification: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var classifyName : [String] = ["所有產品"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classifyName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classificationCell", for: indexPath) as! classificationCell
        let fileUrl = URL(string: "https://test.kouhu.com.tw/web/image/product.template/1/image")
        
        cell.classificationImage.af_setImage(withURL: fileUrl!)
        cell.classificationName.text = classifyName[indexPath.row]
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let count = globalVar.category?.result.count {
            for index in 0..<count {
                self.classifyName.append((globalVar.category?.result[index].name)!.trimmingCharacters(in: .whitespaces))
            }
        }
        
    }
}
