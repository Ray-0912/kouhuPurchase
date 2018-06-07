//
//  memberDataDetail.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/6/6.
//  Copyright © 2018年 alltop. All rights reserved.
//

import Foundation
import UIKit


class modifyData : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    @IBOutlet weak var txtAccount: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSex: UITextField!
    @IBOutlet weak var txtBirth: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtAddress1: UITextField!
    
    var passData : [String] = ["account","name","sex","birth","phone","add"]
    
    var pickerViewSex : [String] = ["男性","女性"]
    
    @IBAction func changePwd(_ sender: UIButton) {
    }
    
    @IBAction func rewrite(_ sender: UIButton) {
        txtName.text = passData[1]
        txtSex.text  = passData[2]
    }
    
    @IBAction func confirm(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        var pickerViewForSex = UIPickerView()
        pickerViewForSex.delegate = self
        // multi picker use tag!
        txtSex.inputView = pickerViewForSex
        
        txtAccount.isEnabled = false
        txtBirth.isEnabled   = false
        txtPhone.isEnabled   = false
    }
    
    override func didReceiveMemoryWarning() {
        super .didReceiveMemoryWarning()
    }
}
