//
//  APIManagar.swift
//  SampleAPI
//
//  Created by shailesh on 22/08/18.
//  Copyright © 2018 Shailesh. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit


class APIManagar{
    
    static let api = APIManagar()
    private init(){}
    func fetchData() -> Promise<[Category]>{
        return Promise{
            resolver in
            
            Alamofire.request(BASE_URL).responseString(){
                responce in
                switch(responce.result){
                    
                case.success(let data):
                    if let json = data.data(using: .utf8){
                        do{
                        let categoryRes = try JSONDecoder().decode(Menuresponce.self, from: json)
                            resolver.fulfill((categoryRes.categories))
                        }catch{
                            print(error.localizedDescription)
                        }

                    }
                
                    print("My API Responce:-", data)
                    
                case .failure(let error):
                    resolver.reject(error)
                    print(error)
                }
            }
        }
        
 
        
     }
    
}
