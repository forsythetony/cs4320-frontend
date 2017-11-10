//
//  PMAddPropertyViewController.swift
//  property_management_app
//
//  Created by Tony Forsythe on 11/9/17.
//  Copyright © 2017 Tony Forsythe. All rights reserved.
//

import UIKit
import XLForm

enum XLConfigPropertyKey : String {
    case TextFieldPlaceholder = "textField.placeholder"
}

class PMAddPropertyViewController: XLFormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: Setup Functions
    private func setup() {
        setupForm()
    }
    
    private func setupForm() {
        
        let form    : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row     : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "New Property")
        
        //  Location Section
        section = XLFormSectionDescriptor()
        
        section.title = "Property Location"
        
        
        //  Street Address
        row = XLFormRowDescriptor(  tag: PMPropertyKeys.streetAddress.rawValue,
                                    rowType: XLFormRowDescriptorTypeText,
                                    title: "Street Address")
        
        row.cellConfigAtConfigure[XLConfigPropertyKey.TextFieldPlaceholder.rawValue] = "ex: 419 Hitt St."
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(  tag: PMPropertyKeys.city.rawValue,
                                    rowType: XLFormRowDescriptorTypeText,
                                    title: "City")
        
        row.cellConfigAtConfigure[XLConfigPropertyKey.TextFieldPlaceholder.rawValue] = "ex: St. Louis"
        section.addFormRow(row)
        
        
        row = XLFormRowDescriptor(  tag: PMPropertyKeys.state.rawValue,
                                    rowType: XLFormRowDescriptorTypeText,
                                    title: "State")
        
        row.cellConfigAtConfigure[XLConfigPropertyKey.TextFieldPlaceholder.rawValue] = "ex: MO"
        section.addFormRow(row)
        
        
        row = XLFormRowDescriptor(  tag: PMPropertyKeys.zip.rawValue,
                                    rowType: XLFormRowDescriptorTypeZipCode,
                                    title: "Zip Code")
        
        section.addFormRow(row)
        
        
        
        form.addFormSection(section)
        
        
        
        
        self.form = form
    }
    
}
