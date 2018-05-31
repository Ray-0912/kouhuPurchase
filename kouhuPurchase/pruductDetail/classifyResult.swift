//
//  classifyResult.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/5/8.
//  Copyright © 2018年 alltop. All rights reserved.
//

import Foundation
import UIKit

class classifyResult : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var result : product?
    var shoppingCartIds : [Int] = []
    
    var segueToDetail = 0
    
    let callMethods = libs()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        shoppingCartIds = callMethods.getShoppingCartIds()
    }
    
    override func didReceiveMemoryWarning() {
        super .didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (result?.result.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "classifyResultCell", for: indexPath) as! classifyResultCell
        let fileUrl = URL(string: "\(globalVar.imageURL)\((result?.result[indexPath.row].id)!)/image")
        
        
        cell.classifyResultImage.af_setImage(withURL: fileUrl!)
        cell.classifyResultName.text = result?.result[indexPath.row].name
        cell.classifyResultPrice.text = "$" + String(format:"%.0f", (result?.result[indexPath.row].list_price)!)
        cell.classifyResultShoppingCart.tag = indexPath.row
        for item in shoppingCartIds {
            if (item == result?.result[indexPath.row].id) {
                cell.classifyResultShoppingCart.setTitle("移出購物車", for: UIControlState.normal)
            }
        }
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        segueToDetail = indexPath.row
        performSegue(withIdentifier: "resultToDetail", sender: nil)
    }
    
    @IBAction func addShoppingCart(_ sender: UIButton) {
        if let _ = shoppingCartIds.index(of: (result?.result[sender.tag].id)! ) {
            callMethods.delFromShoppingCart(id: Int32((result?.result[sender.tag].id)!))
            sender.setTitle("加入購物車", for: .normal)
            shoppingCartIds.remove(at: shoppingCartIds.index(of: (result?.result[sender.tag].id)!)!)
            
        } else {
            callMethods.addToShoppingCart(id: Int32((result?.result[sender.tag].id)!),
                                          categ: Int32((result?.result[sender.tag].public_categ_ids[0])!),
                                          name: (result?.result[sender.tag].name)!,
                                          price: (result?.result[sender.tag].list_price)!)
            sender.setTitle("移出購物車", for: .normal)
            shoppingCartIds.append((result?.result[sender.tag].id)!)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultToDetail" {
            let controller = segue.destination as! productDetail
            
            controller.name       = result?.result[segueToDetail].name
            controller.id         = result?.result[segueToDetail].id
            controller.list_price = result?.result[segueToDetail].list_price
        }
    }
}

