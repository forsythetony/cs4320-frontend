//
//  PMPropertiesMapView.swift
//  property_management_app
//
//  Created by Tony Forsythe on 11/2/17.
//  Copyright © 2017 Tony Forsythe. All rights reserved.
//

import UIKit
import MapKit
import SnapKit
import CoreGraphics

extension CGPoint {
    
    func pointWithVerticalOffset(o : CGFloat) -> CGPoint {
        var p = self
        
        p.y += o
        
        return p
    }
    
    func pointWithHorizontalOffset(o : CGFloat) -> CGPoint {
        var p = self
        
        p.x += o
        
        return p
    }
    
    func horizontalOffsets(o : CGFloat) -> (CGPoint, CGPoint) {
        
        let p1 = self.pointWithHorizontalOffset(o: -o)
        let p2 = self.pointWithHorizontalOffset(o: o)
        
        return (p1,p2)
    }
    
    func verticalOffsets(o : CGFloat) -> (CGPoint, CGPoint) {
        let p1 = self.pointWithVerticalOffset(o: -o)
        let p2 = self.pointWithVerticalOffset(o: o)
        
        return (p1,p2)
    }
}
extension CGSize {
    
    var ZeroPointRect : CGRect {
        get {
            return CGRect(x: 0.0, y: 0.0, width: self.width, height: self.height)
        }
    }
}
class PMPropertyPinView : MKAnnotationView {
    
    private var numberLabel : UILabel!
    
    private var total_tenants : Int = 0
    
    var totalTenants : Int {
        set {
            total_tenants = newValue
        }
        get {
            return total_tenants
        }
    }
    
    static let size = CGSize(width: 35.0, height: 35.0)
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clear
        self.frame = PMPropertyPinView.size.ZeroPointRect
        
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let ref = UIGraphicsGetCurrentContext() else { return }
        
        let fontSize = 15.0
        
        let backgroundColor = UIColor.PMRedOne
        
        ref.setStrokeColor(backgroundColor.cgColor)
        ref.setFillColor(backgroundColor.cgColor)

        let width = self.frame.size.width
        let height = self.frame.size.height


        let centerPoint = CGPoint(x: self.frame.width / 2.0, y: self.frame.height / 2.0)
        let radius = (width / 2.0) - (width * 0.02)
        
        let circlePath = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: 0.0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        
        circlePath.stroke()
        circlePath.fill()
        
        let tenantsStr = "\(self.totalTenants)" as NSString
        
        let f = UIFont.systemFont(ofSize: fontSize.CGFloatValue, weight: .bold)
        let tc = UIColor.white
        let bc = UIColor.clear
        
        let attr = [NSAttributedStringKey.font : f, NSAttributedStringKey.foregroundColor : tc, NSAttributedStringKey.backgroundColor : bc]
        
        let size = tenantsStr.size(withAttributes: attr)
        
        let centerX = width / 2.0 - (size.width / 2.0)
        let centerY = height / 2.0 - (size.height / 2.0)
        
        let strFrame = CGRect(x: centerX, y: centerY, width: size.width, height: size.height)
        
        tenantsStr.draw(in: strFrame, withAttributes: attr)
        
        
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
class PMPropertiesMapView: UIViewController, MKMapViewDelegate {

    private lazy var properties : [PMProperty] = [PMProperty]()
    
    private var mapView : MKMapView!
    
    var pins = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func setup() {
        setupMap()
        
        
        loadProperties()
    }

    private func setupMap() {
        
        let mv = MKMapView()
        
        view.addSubview(mv)
        
        
        mv.snp.makeConstraints { (make) in
            
            make.edges.equalTo(self.view)
            make.height.equalTo(self.view)
            make.width.equalTo(self.view)
        }
        
        mv.setRegion(TestValues().testCoordinateRegion, animated: false)
        mv.isUserInteractionEnabled = true
        mv.delegate = self
        
        self.mapView = mv
    }
    private func reloadMap() {
        
        
        
        var gpsPoints = [CLLocationCoordinate2D]()
        
        for prop in self.properties {
            
            let coord = prop.gpsCoordinate.coordinateValue
            
            gpsPoints.append(coord)
            
            
            let pntAnnotation = MKPointAnnotation()
            
            pntAnnotation.title = "\(prop.totalTenants)"
            pntAnnotation.coordinate = coord
            
            pins.append(pntAnnotation)
        }
        
        let gpsInfo = PMLocationHelper.findCoordinateCenter(coords: gpsPoints)
        
        
        
        self.mapView.addAnnotations(pins)
    
        let spanModifier = 0.0085
        
        let reg = MKCoordinateRegion(center: gpsInfo.0, span: MKCoordinateSpanMake(gpsInfo.1.latitudeDelta + spanModifier, gpsInfo.1.longitudeDelta + spanModifier))
        
        self.mapView.setRegion(reg, animated: true)
    }

    private func loadProperties() {
        
        PMDataManager.sharedManager.getPropertiesForUser(userID: 1) { (result) in
            self.properties = result
            self.reloadMap()
        }
    }
}
