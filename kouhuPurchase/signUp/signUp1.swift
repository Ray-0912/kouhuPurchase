//
//  signUp1.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/3/27.
//  Copyright © 2018年 alltop. All rights reserved.
//

import Foundation
import UIKit

class signUp1 : UIViewController {
    @IBOutlet weak var txtAccunt: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPasswordAgain: UITextField!
    
    @IBAction func btnFacebook(_ sender: UIButton) {
    }
    
    @IBAction func btnNextStep(_ sender: UIButton) {
        let callMethods = libs()
        
//        callMethods.accountCheck(txtAccunt.text!)
        
        
        performSegue(withIdentifier: "step2", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! signUp4
        controller.account  = txtAccunt.text!
        controller.password = txtPassword.text!
    }
    
}
