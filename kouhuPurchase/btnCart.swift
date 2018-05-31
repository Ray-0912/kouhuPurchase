//
//  cart.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/5/11.
//  Copyright © 2018年 alltop. All rights reserved.
//

import UIKit

class cart: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.shadowOffset  = CGSize(width: 5, height: 5)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius  = 5
        self.layer.shadowColor   = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
        
        self.backgroundColor = UIColor(red: 255.0/255.0, green: 93.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        self.tintColor = UIColor.white

    }
    
}



