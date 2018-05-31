//
//  searchResult.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/4/3.
//  Copyright © 2018年 alltop. All rights reserved.
//

import Foundation
import UIKit

class productDetail: UIViewController {
    
    var name        : String?
    var id          : Int?
    var list_price  : Double?
    
    @IBOutlet weak var detailImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImage.af_setImage(withURL: URL(string: "\(globalVar.imageURL)\(id!)/image")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
    }
    
}
