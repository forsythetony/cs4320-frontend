//
//  PMIconGenerator.swift
//  property_management_app
//
//  Created by Tony Forsythe on 11/2/17.
//  Copyright © 2017 Tony Forsythe. All rights reserved.
//

import Foundation
import FontAwesome_swift


enum PMTabBarItem {
    case PropertiesScreen
}
class PMIconGenerator {
    
    private static func getDefaultTabBarImage() -> UIImage {
        
        let iconDim : Double = 50.0
        let iconSize = CGSize(width: iconDim, height: iconDim)
        let iconColor = UIColor.red
        
        
        return UIImage.fontAwesomeIcon(name: .question, textColor: iconColor, size: iconSize)
    }
    
    
    static func getTabBarImageForTabBarItem(item : PMTabBarItem) -> UIImage {

        var retVal : UIImage?
        
        
        switch item {
            
        case .PropertiesScreen:
            
            let iconColor = UIColor.red
            let iconDim : Double = 50.0
            let iconSize = CGSize(width: iconDim, height: iconDim)
            
            retVal = UIImage.fontAwesomeIcon(name: .home, textColor: iconColor, size: iconSize)
        }
        
        
        
        
        return retVal!
    }
    
}
