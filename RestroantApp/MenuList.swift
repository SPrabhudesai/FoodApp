//
//  MenuList.swift
//  RestroantApp
//
//  Created by shailesh on 21/08/18.
//  Copyright © 2018 Shailesh. All rights reserved.
//

import UIKit

class MenuList: UITableView,UITableViewDelegate, UITableViewDataSource {

    var dataSourceArray = [Category](){
        didSet{
            reloadData()
        }
    }
    
    
    
    override func awakeFromNib() {
        self.dataSource = self
        self.delegate = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSourceArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        switch(section){
        case 0:
            return 2
        case 1:
            return 1
         default:
            return dataSourceArray[section-1].items.count

        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: SUMMER_CELL)
                return cell!
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: SWITCH_CELL)
                return cell!
            }
            }else if indexPath.section == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: RECOMMENED_CELL, for: indexPath) as! RecommandedTableViewCell
            cell.recommandedList.listData = dataSourceArray[0].items
                return cell
        }else{
             let cell = tableView.dequeueReusableCell(withIdentifier: DISH_CELL, for: indexPath) as! DishCell
            cell.populateCell(dish: dataSourceArray[indexPath.section-1].items[indexPath.row])
            cell.addButton.tag = indexPath.row
            cell.intButton.tag = indexPath.row
            cell.decButton.tag = indexPath.row

            cell.addButton.addTarget(self, action: #selector(MenuList.addItem(sender:)), for:.touchUpInside)
            cell.intButton.addTarget(self, action: #selector(MenuList.addItem(sender:)), for:.touchUpInside)
            cell.decButton.addTarget(self, action: #selector(MenuList.removeItem(sender:)), for:.touchUpInside)


            return cell
        }
        
     }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 50
        }else if indexPath.section == 1{
            let recommandedItemCount = dataSourceArray.count
            if recommandedItemCount % 2 == 0{
                return CGFloat (170.0) * CGFloat(recommandedItemCount%2)
            }else{
                return CGFloat(170) * CGFloat((recommandedItemCount%2)+1)
            }
        }else{
            return 55
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        switch (section) {
        case 0:
            return nil
        default:
            return dataSourceArray[section-1].name

        }
    }
    
    
    
    @objc func addItem(sender:UIButton){
        let point = sender.convert(CGPoint.zero, to: self as UIView)
        let indexPath:IndexPath! = self.indexPathForRow(at: point)
        Cart.cart.addItem(dish: dataSourceArray[indexPath.section - 1].items[indexPath.row-1])
        self.reloadRows(at: [indexPath], with: .none)
    }
    
    @objc func removeItem(sender:UIButton){
        let point = sender.convert(CGPoint.zero, to: self as UIView)
        let indexPath:IndexPath! = self.indexPathForRow(at: point)
        Cart.cart.removeItem(dish: dataSourceArray[indexPath.section - 1].items[indexPath.row-1])
        self.reloadRows(at: [indexPath], with: .none)

    }
}
