//
//  PMDataManager.swift
//  property_management_app
//
//  Created by Tony Forsythe on 11/2/17.
//  Copyright © 2017 Tony Forsythe. All rights reserved.
//

import UIKit
import Alamofire

class PMDataManager: NSObject {
    
    let API_BASE_URL = "http://localhost:8080"
    
    static let sharedManager = PMDataManager()
    
    
    
    func getPropertiesForUser(userID : Int, completion : @escaping ([PMProperty]) -> Void){
        
        let urlString = "\(API_BASE_URL)/property/user?uid=\(userID)"
        
        Alamofire.request(urlString).responseJSON { response in
            
            var allProps : [PMProperty] = [PMProperty]()
            
            
            if let json = response.result.value as? [[String: Any]] {
                
                for item in json {
                    
                    let newVal = PMProperty.buildWithJSONResult(jsonDict: item)
                    
                    allProps.append(newVal)
                    
                }
            }
            
            
            completion(allProps)
        }
    }
    
    
    
    func getPropertyWithID(propID : Int, completion : @escaping (PMProperty) -> Void) {
        
        let urlString = "\(API_BASE_URL)/property/\(propID)"
        
        
        Alamofire.request(urlString).responseJSON { (response) in
            
            
            if let json = response.result.value as? [String : Any] {
                
                let r = PMProperty.buildWithJSONResult(jsonDict: json)
                
                completion(r)
            }
            else {
                //  Handle the error somehow here
            }
        }
    }
    
    
}

func printAllProperties(props : [PMProperty]) {
    
    
    for prop in props {
        print("\(prop.getPrintString())\n")
    }
}
