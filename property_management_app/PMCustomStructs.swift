//
//  PMCustomStructs.swift
//  property_management_app
//
//  Created by Tony Forsythe on 11/2/17.
//  Copyright © 2017 Tony Forsythe. All rights reserved.
//

import Foundation
import MapKit


let DEFAULT_COORDINATE_SPAN = 0.05

struct PMCoordinate {
    var latitude : Double!
    var longitude : Double!
    
    
    func getPrintString() -> String {
        return "(lat: \(latitude), long: \(longitude)"
    }

}



struct TestValues {
    
    let testCoordinate = CLLocationCoordinate2DMake(38.956899999999997, -92.316199999999995)
    let testCoordinateSpan = MKCoordinateSpan(latitudeDelta: DEFAULT_COORDINATE_SPAN, longitudeDelta: DEFAULT_COORDINATE_SPAN)
    
    let testCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2DMake(38.956899999999997, -92.316199999999995), span: MKCoordinateSpan(latitudeDelta: DEFAULT_COORDINATE_SPAN, longitudeDelta: DEFAULT_COORDINATE_SPAN))
    
}

extension Double {
    
    var CGFloatValue : CGFloat {
        get {
            return CGFloat(self)
        }
    }
}

extension UIEdgeInsets {
    
    var totalWidth : CGFloat {
        get {
            return self.left + self.right
        }
    }
}
