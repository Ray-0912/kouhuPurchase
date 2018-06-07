//
//  signUp1.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/3/27.
//  Copyright © 2018年 alltop. All rights reserved.
//

import Foundation
import UIKit

class finish : UIViewController {
    @IBAction func btnNavigationBack(_ sender: UIButton) {
        let myStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let whiteViewController = myStoryBoard.instantiateViewController(withIdentifier: "Main")
        present(whiteViewController, animated:true, completion:nil)
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        performSegue(withIdentifier: "backMain", sender: nil)
    }
}

