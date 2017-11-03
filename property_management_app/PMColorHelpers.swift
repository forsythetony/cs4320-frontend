//
//  PMColorHelpers.swift
//  property_management_app
//
//  Created by Tony Forsythe on 11/3/17.
//  Copyright © 2017 Tony Forsythe. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    
    var colorVal : CGFloat {
        get {
            return self / 255.0
        }
    }
}
extension UIColor {
    
    static func PMColorFromRGBA( r : CGFloat, g : CGFloat, b : CGFloat, a : CGFloat) -> UIColor {
        
        return UIColor(red: r.colorVal, green: g.colorVal, blue: b.colorVal, alpha: a)
    }
    
    static var PMPatternBackgroundOne : UIColor {
        get {
            
            if let img = UIImage(named: "spire_dark") {
                return UIColor(patternImage: img)
            }
            
            return UIColor.black
        }
    }
    
    
    static var PMRedOne : UIColor {
        
        get {
            
            // 128, 21, 21
            
            let r = 128.0.CGFloatValue
            let g = 21.0.CGFloatValue
            let b = 21.0.CGFloatValue
            
            return UIColor.PMColorFromRGBA(r: r, g: g, b: b, a: 1.0)
        }
    }
    
    
}
