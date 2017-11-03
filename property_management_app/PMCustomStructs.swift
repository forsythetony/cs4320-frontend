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

    var coordinateValue : CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
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

extension Int {
    
    var DoubleValue : Double {
        get {
            return Double(self)
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


struct PMLocationHelper {
    
    
    static func findCoordinateCenter( coords : [CLLocationCoordinate2D]) -> (CLLocationCoordinate2D, MKCoordinateSpan) {
        
        var latitudeSum = 0.0
        var longitudeSum = 0.0
        
        var longitudes = [Double]()
        var latitudes = [Double]()
        
        
        for c in coords {
            
            latitudeSum += c.latitude
            longitudeSum += c.longitude
            
            longitudes.append(c.longitude)
            latitudes.append(c.latitude)
            
        }
        
        let maxLong = longitudes.max() ?? 0.0
        let minLong = longitudes.min() ?? 0.0
        let maxLat = latitudes.max() ?? 0.0
        let minLat = latitudes.min() ?? 0.0
        
        let coord = CLLocationCoordinate2D(latitude: latitudeSum / coords.count.DoubleValue, longitude: longitudeSum / coords.count.DoubleValue)
//
        let span = MKCoordinateSpan(latitudeDelta: fabs(maxLat - minLat), longitudeDelta: fabs(maxLong - minLong))
//
        return (coord, span)
    }
}
