//
//  signUp1.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/3/27.
//  Copyright © 2018年 alltop. All rights reserved.
//

import Foundation
import UIKit

class signUp5 : UIViewController {
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtZone: UITextField!
    @IBOutlet weak var txtRoad: UITextField!
    @IBOutlet weak var txtDetail: UITextField!
    
    var account : String = ""
    var password: String = ""
    var name    : String = ""
    var gender  : String = ""
    var birthday: String = ""
    
    var address : String = ""
    
    
    @IBAction func btnSearch(_ sender: UIButton) {
    }
    
    @IBAction func btnNextStep(_ sender: UIButton) {
        let callMethods = libs()
        callMethods.creatAccount(account: self.account, password: self.password, name: self.name, sex: self.gender, birth: self.birthday, address: self.address)
        
        performSegue(withIdentifier: "step4", sender: nil)
    }
    
    
}

