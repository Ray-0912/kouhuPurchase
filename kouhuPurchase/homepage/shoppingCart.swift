//
//  shoppingCart.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/4/12.
//  Copyright © 2018年 alltop. All rights reserved.
//

import Foundation
import UIKit

class cartProduct {
    var name : String = ""
    var weight : String = ""
    var priceAndAmount : String = ""
    var price : Double?
    var id : Int32?
}

class shoppingCart: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var cartList : [cartProduct] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCartCell", for: indexPath) as! shoppingCartCell
        let fileUrl = URL(string: "\(globalVar.imageURL)\((cartList[indexPath.row].id)!)/image")
        cell.cartImage.af_setImage(withURL: fileUrl!)
        cell.cartName.text = cartList[indexPath.row].name
        cell.cartPrice.text = String((cartList[indexPath.row].price)!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartList.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
        do {
            let appDel = UIApplication.shared.delegate as? AppDelegate
            guard let context = appDel?.persistentContainer.viewContext else { return }
            let result = try context.fetch(ShoppingCart.fetchRequest())
            
            for item in result {
                let shoppingCart = item as? ShoppingCart
                let cart = cartProduct.init()
                cart.name = (shoppingCart?.name)!
                cart.price = (shoppingCart?.list_price)!
                cart.id = (shoppingCart?.id)!
                
                cartList.append(cart)
            }
        } catch {}
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func takeBill(_ sender: UIButton) {
        performSegue(withIdentifier: "cartToDetail", sender: nil)
    }
    
    @IBAction func closePopup(segue: UIStoryboardSegue) {}
    
}
