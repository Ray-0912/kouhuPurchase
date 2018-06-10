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
    
    var id          : Int32?
    var name        : String?
    var categ       : Int32?
    var list_price  : Double?
    var callMethods = libs()
    
    @IBOutlet weak var detailImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImage.af_setImage(withURL: URL(string: "\(globalVar.imageURL)\(id!)/image")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        callMethods.addToShoppingCart(id: self.id!, categ: self.categ!, name: self.name!, price: self.list_price!)
    }
    
    @IBAction func addToCollection(_ sender: UIButton) {
        callMethods.addToCollection(id: self.id!, categ: self.categ!, name: self.name!, price: self.list_price!)
    }
}
