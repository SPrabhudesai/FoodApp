//
//  Cart.swift
//  RestroantApp
//
//  Created by shailesh on 30/08/18.
//  Copyright © 2018 Shailesh. All rights reserved.
//

import Foundation


class Cart{
    var cartItems = [CartItems]()
    static let cart = Cart()
    private init(){}
    
    func addItem(dish:MenuProduct){
        if cartItems.contains(where: {$0.productID == dish.product_id}){
            cartItems = cartItems.map{
                if $0.productID == dish.product_id{
                   $0.quantity = $0.quantity+1
                }
                return $0
            }
        }else{
            let item = CartItems(id: dish.product_id, name: dish.name, price: dish.price, isVeg: dish.isVeg)
            cartItems.append(item)
            
        }
    }
    
    
    func removeItem(dish:MenuProduct){
        let item = cartItems.first(where: {$0.productID == dish.product_id})
        if item!.quantity == 1{
            cartItems = cartItems.filter({$0.quantity != dish.product_id})
        }else{
            cartItems = cartItems.map{
                if $0.productID == dish.product_id{
                    $0.quantity = $0.quantity+1
                }
                return $0
        }
        
    }
    
    }
    func getQuantity(dish:MenuProduct) ->Int{
        let item = cartItems.first(where: {$0.productID == dish.product_id})
        return item!.quantity
    }
}


class CartItems{
    var productID = Int()
    var name = String()
    var price = String()
    var quantity = Int()
    var isVeg = Bool()
    
    
    init(id:Int, name:String, price:String, isVeg:Bool){
        self.productID = id
        self.name = name
        self.price = price
        self.quantity = 1
        self.isVeg = isVeg
    }
}
