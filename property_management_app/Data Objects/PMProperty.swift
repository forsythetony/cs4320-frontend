//
//  PMProperty.swift
//  property_management_app
//
//  Created by Tony Forsythe on 11/2/17.
//  Copyright © 2017 Tony Forsythe. All rights reserved.
//

import Foundation

enum PMPropertyKeys : String {
    case ID = "id"
    case streetAddress = "streetAddress"
    case state = "state"
    case zip = "zip"
    case imageURLMain = "imgUrlMain"
    case imageUrlThumb = "imgUrlThumb"
    case latitude = "latitude"
    case longitude = "longitude"
}
struct PMProperty {
    
    var ID : Int!
    var streetAddress : String!
    var state : String!
    var zip : String!
    var imageURLMain : String!
    var imageURLThumb : String!
    var gpsCoordinate : PMCoordinate!
    
    
    static func buildWithJSONResult( jsonDict : [String : Any]) -> PMProperty {
        
        var newProp = PMProperty()
        
        newProp.ID = getIntValueFromDict(dict: jsonDict, type: .ID)
        
        newProp.streetAddress = getStringValueFromDict(dict: jsonDict, type: .streetAddress)
        
        newProp.state = getStringValueFromDict(dict: jsonDict, type: .state)
        
        newProp.zip = getStringValueFromDict(dict: jsonDict, type: .zip)
        
        newProp.imageURLMain = getStringValueFromDict(dict: jsonDict, type: .imageURLMain)
        
        newProp.imageURLThumb = getStringValueFromDict(dict: jsonDict, type: .imageUrlThumb)
        
        if  let coord_long = jsonDict[PMPropertyKeys.longitude.rawValue] as? Double {
            
            if let coord_lat = jsonDict[PMPropertyKeys.latitude.rawValue] as? Double {
                
                newProp.gpsCoordinate = PMCoordinate(latitude: coord_lat, longitude: coord_long)
            }
        }
        
        
        return newProp
    }
    
    func getPrintString() -> String {
        
        var printString = ""
        
        let delimString = getDelimString(delim: "\t", count: 2)
        
        printString.append("ID:\(delimString)\(self.ID)\n")
        printString.append("Street Address:\(delimString)\(self.streetAddress)\n")
        printString.append("State:\(delimString)\(self.state)\n")
        printString.append("ZIP:\(delimString)\(self.zip)\n")
        printString.append("Image Main:\(delimString)\(self.imageURLMain)\n")
        printString.append("Image Thumb:\(delimString)\(self.imageURLThumb)\n")
        printString.append("Coordinates:\(delimString)\(self.gpsCoordinate.getPrintString())\n")
        
        
        
        return printString
    }
}

func getDelimString(delim : String, count : Int = 2) -> String {
    
    var delimString = ""
    
    for _ in 0...count {
        delimString.append(delim)
    }
    
    return delimString
}
func getIntValueFromDict(dict : [String :Any], type : PMPropertyKeys) -> Int {
    if let v = dict[type.rawValue] as? Int {
        return v
    }
    else {
        return 0
    }
}
func getStringValueFromDict( dict : [String : Any], type : PMPropertyKeys) -> String {
    
    if let v = dict[type.rawValue] as? String {
        return v
    }
    else {
        return ""
    }
}
