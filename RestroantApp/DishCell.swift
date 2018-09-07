//
//  DishCell.swift
//  RestroantApp
//
//  Created by shailesh on 21/08/18.
//  Copyright © 2018 Shailesh. All rights reserved.
//

import UIKit

class DishCell: UITableViewCell {
    
    
    @IBOutlet var intButton: UIButton!
    @IBOutlet var decButton: UIButton!
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var symbolImage: UIImageView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var quantityView: UIView!
    @IBOutlet var dishName: UILabel!
    @IBOutlet var dishPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(dish:MenuProduct){
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
