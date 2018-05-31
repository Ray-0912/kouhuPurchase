//
//  signUp1.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/3/27.
//  Copyright © 2018年 alltop. All rights reserved.
//

import Foundation
import UIKit

class signUp4 : UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtBirYear: UITextField!
    @IBOutlet weak var txtBirMonth: UITextField!
    @IBOutlet weak var txtBirDate: UITextField!
    
    var account : String = ""
    var password: String = ""
    
    var birthday : String = ""
    
    @IBAction func btnNextStep(_ sender: UIButton) {
        performSegue(withIdentifier: "step3", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! signUp5
        controller.account = self.account
        controller.password = self.password
        controller.gender = txtGender.text!
        controller.birthday = self.birthday
    }
}

