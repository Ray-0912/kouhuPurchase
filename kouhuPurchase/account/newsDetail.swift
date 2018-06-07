//
//  newsDeatil.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/6/6.
//  Copyright © 2018年 alltop. All rights reserved.
//

import Foundation
import UIKit

class newsDetail : UIViewController {
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsContent: UITextView!
    @IBOutlet weak var newsEnddate: UILabel!
    
    override func viewDidLoad() {
        super .viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super .didReceiveMemoryWarning()
    }
}
