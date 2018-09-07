//
//  RecommandedDishCell.swift
//  RestroantApp
//
//  Created by shailesh on 21/08/18.
//  Copyright © 2018 Shailesh. All rights reserved.
//

import UIKit
import AlamofireImage

class RecommandedDishCell: UICollectionViewCell {
    
    @IBOutlet var dishImage: UIImageView!
    @IBOutlet var dishName: UILabel!
    @IBOutlet var dishCategory: UILabel!
    @IBOutlet var dishPrice: UILabel!
    @IBOutlet var intButton: UIButton!
    @IBOutlet var decButton: UIButton!
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var symbolImage: UIImageView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var quantityView: UIView!
    
 
    
    func populateCell(dish:MenuProduct){
        
        if let url = URL(string: dish.img){
            dishImage.af_setImage(withURL: url)
        }
        dishName.text = dish.name
        dishPrice.text = dish.price
        if dish.isVeg{
            symbolImage.image = UIImage(named: "")
        }else{
            symbolImage.image = UIImage(named: "")
        }
        
        if Cart.cart.cartItems.contains(where: {$0.productID == dish.product_id}){
            quantityView.isHidden = false
            quantityLabel.text = "\(Cart.cart.getQuantity(dish: dish))"
        }else{
            quantityView.isHidden = true
            
        }
    }

    
}
