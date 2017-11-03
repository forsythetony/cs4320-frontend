//
//  JMPropertyCollectionViewCell.swift
//  property_management_app
//
//  Created by Tony Forsythe on 11/3/17.
//  Copyright © 2017 Tony Forsythe. All rights reserved.
//

import UIKit

class JMPropertyCollectionViewCell: UICollectionViewCell {

    
    static let REUSE_ID = "property_coll_view_cell"
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblBackground: UIView!
    @IBOutlet weak var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    private func setup() {
        
        lblBackground.backgroundColor = UIColor.black
        
        lbl.textColor = UIColor.white
        
        imgView.contentMode = .scaleAspectFill
    }

}
