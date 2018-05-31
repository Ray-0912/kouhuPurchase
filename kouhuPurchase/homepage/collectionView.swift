//
//  collectionView.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/5/2.
//  Copyright © 2018年 alltop. All rights reserved.
//

import Foundation
import UIKit

class collectionModule {
    var image  : String = ""
    var name   : String = ""
    var detail : String = ""
}

class collectionView : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var collectionList : [collectionModule] = []
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "collectionCell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectionList.count
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
