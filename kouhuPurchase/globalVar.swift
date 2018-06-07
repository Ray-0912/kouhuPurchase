//
//  globalVar.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/3/22.
//  Copyright © 2018年 alltop. All rights reserved.
//

import Foundation

struct product: Codable {
    var result  : [output]
    struct output : Codable {
        var public_categ_ids : [Int]
        var list_price : Double
        var id : Int
        var name : String
    }
}

struct cate : Codable {
    var result : [output]
    struct output : Codable{
        var id : Int
        var name : String
    }
}

struct token : Codable {
    var token : String = ""
}

struct globalVar {
    static var URL = "https://test.kouhu.com.tw/api/v1.0/"
    static var imageURL = "https://test.kouhu.com.tw/web/image/product.template/"
    static var categImage = "https://test.kouhu.com.tw/web/image/product.public.category/"
    static var DB  = "test.kouhu.com.tw"
    static let account     = "admin"
    static let password    = "admin"
    
    static var token = ""
    
    static var category : cate?
}


