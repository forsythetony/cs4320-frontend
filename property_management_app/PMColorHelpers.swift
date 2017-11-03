//
//  PMColorHelpers.swift
//  property_management_app
//
//  Created by Tony Forsythe on 11/3/17.
//  Copyright © 2017 Tony Forsythe. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static var PMPatternBackgroundOne : UIColor {
        get {
            
            if let img = UIImage(named: "spire_dark") {
                return UIColor(patternImage: img)
            }
            
            return UIColor.black
        }
    }
    
    
    
    
    
}
