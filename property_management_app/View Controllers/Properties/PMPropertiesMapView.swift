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

class PMPropertiesMapView: UIViewController {

    private lazy var properties : [PMProperty] = [PMProperty]()
    
    private var mapView : MKMapView!
    
    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
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
    }
    private func reloadMap() {
        
    }
    private func loadProperties() {
        
        PMDataManager.sharedManager.getPropertiesForUser(userID: 1) { (result) in
            self.properties = result
            self.reloadMap()
        }
    }
}
