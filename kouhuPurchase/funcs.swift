//
//  methods.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/4/18.
//  Copyright © 2018年 alltop. All rights reserved.

import Foundation
import Alamofire


class libs {
    func askToken(acct : String = "admin", pwd : String = "admin") -> Bool {
        var checkBool : Bool?
        let getUrl = URL(string: "\(globalVar.URL)get_token?a=\(acct)&s=\(pwd)&db=\(globalVar.DB)")
        
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: getUrl!)){data, response, error in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let data = data, let tokenResult = try? decoder.decode(token.self, from: data) {
                globalVar.token = tokenResult.token
                checkBool = true
            } else {
                checkBool = false
            }
        }
        
        dataTask.resume()
        
        while (checkBool == nil) { }
        
        return checkBool ?? false
    }
    
    //to get product data
    func getProductData(filter : String = "") -> product {
        var checkstr = ""
        var returnProduct : product?
        let urlString : String =
            "\(globalVar.URL)product.template?&token=\(globalVar.token)&fields=['list_price','name','public_categ_ids','id']&filter=[\(filter)]"

        let getUrl = URL(string : urlString)
        
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: getUrl!)){ data, response, error in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let data = data, let productResult = try? decoder.decode(product.self, from: data) {
                returnProduct = productResult
            } else {
                print("error")
            }
            checkstr="done"
        }
        
        dataTask.resume()
        while checkstr == "" { }
        
        return returnProduct!
    }
    
    func getCateData() -> Bool {
        var checkBool : Bool?
        let getUrl = URL(string: "\(globalVar.URL)product.public.category?&token=\(globalVar.token)&fields=['id','name']")

        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: getUrl!)) {data, response, error in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let data = data, let cateResult = try? decoder.decode(cate.self, from: data) {
                checkBool = true
                globalVar.category = cateResult
            } else {
                checkBool = false
            }
        }
        
        dataTask.resume()
        while checkBool == nil { }
        
        return checkBool!
    }
    
    //to creat a new account
    func creatAccount(account:String, password:String, name:String, sex:String, birth:String, address:String) {
        let creatURL = "\(globalVar.URL)res.users?token=\(globalVar.token)&name=\(name)&login=\(account)"
        Alamofire.request(creatURL).responseJSON { response in
            if response.result.isSuccess {
                print(response.value as? [String: AnyObject])
            }
        }
    }
    
    func getShoppingCartIds() -> [Int] {
        var shoppingCartIds : [Int] = [0]
        
        do {
            let appDel = UIApplication.shared.delegate as? AppDelegate
            guard let context = appDel?.persistentContainer.viewContext else { return [] }
            let result = try context.fetch(ShoppingCart.fetchRequest())
            
            for item in result {
                let shoppingCart = item as? ShoppingCart
                shoppingCartIds.append(Int((shoppingCart?.id)!))
            }
        } catch {}
        
        return shoppingCartIds
    }
    
    func addToShoppingCart(id:Int32, categ: Int32, name: String, price: Double) {
        do {
            let appDel = UIApplication.shared.delegate as? AppDelegate
            guard let context = appDel?.persistentContainer.viewContext else { return }
            let cartProduct = ShoppingCart(context: context)
            
            cartProduct.id = id
            cartProduct.public_categ_ids = categ
            cartProduct.name = name
            cartProduct.list_price = price
            
            appDel?.saveContext()
        } catch {
            
        }
    }
    
    func delFromShoppingCart(id: Int32) {
        do {
            let appDel = UIApplication.shared.delegate as? AppDelegate
            guard let context = appDel?.persistentContainer.viewContext else { return }
            let result = try context.fetch(ShoppingCart.fetchRequest())
            
            for item in result {
                let cartProduct = item as? ShoppingCart
                if cartProduct?.id == id {
                    context.delete(cartProduct!)
                    appDel?.saveContext()
                }
            }
        } catch {
            
        }
    }
}
