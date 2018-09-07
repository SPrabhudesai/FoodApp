//
//  ViewController.swift
//  RestroantApp
//
//  Created by shailesh on 21/08/18.
//  Copyright © 2018 Shailesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var menuTableView: MenuList!
    override func viewDidLoad() {
        super.viewDidLoad()
        getMenu()
        // Do any additional setup after loading the view, typically from a nib.
     }

    func getMenu(){
        let request = APIManagar.api.fetchData()
        request.done{
            categories in
            self.menuTableView.dataSourceArray = categories
            print("OK")
            print(request)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
 
