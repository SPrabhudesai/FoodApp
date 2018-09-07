//
//  Model.swift
//  RestroantApp
//
//  Created by shailesh on 30/08/18.
//  Copyright © 2018 Shailesh. All rights reserved.
//

import Foundation

struct Menuresponce:Decodable {
    var categories:[Category]
}

struct Category:Decodable {
    var name:String
    var items:[MenuProduct]
}

struct MenuProduct:Decodable{
    var name:String
    var price:String
    var img:String
    var product_id:Int
    var isVeg:Bool
    var must:Bool
}
