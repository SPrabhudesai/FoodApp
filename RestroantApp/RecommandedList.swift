//
//  RecommandedList.swift
//  RestroantApp
//
//  Created by shailesh on 21/08/18.
//  Copyright © 2018 Shailesh. All rights reserved.
//

import UIKit

class RecommandedList: UICollectionView,UICollectionViewDataSource, UICollectionViewDelegate {
    var listData = [MenuProduct](){
        didSet{
            reloadData()
        }
    }
    
    override func awakeFromNib() {
        self.dataSource = self
        self.delegate = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RECOMMED_CELL, for: indexPath) as! RecommandedDishCell
        cell.populateCell(dish: listData[indexPath.row])
        
        cell.addButton.tag = indexPath.row
        cell.intButton.tag = indexPath.row
        cell.decButton.tag = indexPath.row

        cell.addButton.addTarget(self, action: #selector(RecommandedList.addItem(sender:)), for:.touchUpInside)
        cell.intButton.addTarget(self, action: #selector(RecommandedList.addItem(sender:)), for:.touchUpInside)
        cell.decButton.addTarget(self, action: #selector(RecommandedList.removeItem(sender:)), for:.touchUpInside)

        return cell
    }
    
    
    @objc func addItem(sender:UIButton){
        let tag = sender.tag
        Cart.cart.addItem(dish: listData[tag])
        reloadData()
    }
    
    @objc func removeItem(sender:UIButton){
        let tag = sender.tag
        Cart.cart.removeItem(dish: listData[tag])
        reloadData()

    }

}
