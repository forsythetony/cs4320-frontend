//
//  PMPropertyInfoViewController.swift
//  property_management_app
//
//  Created by Tony Forsythe on 11/3/17.
//  Copyright © 2017 Tony Forsythe. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage

class PMPropertyInfoViewController: UIViewController {

    var propertyInfo : PMProperty?
    
    private var infoScrollView : UIScrollView!
    private var propImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setup() {
        
    }
    
    private func setupScrollView() {
        
        let sv = UIScrollView(frame: self.view.bounds)
        
        
        
    }
    
    private func setupImageView() -> UIImageView {
        
        let img = UIImageView()
        
        img.contentMode = .scaleAspectFit
        
        return img
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
