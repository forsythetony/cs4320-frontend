//
//  PMPropertyInformationViewController.swift
//  property_management_app
//
//  Created by Tony Forsythe on 11/7/17.
//  Copyright © 2017 Tony Forsythe. All rights reserved.
//

import UIKit
import XLForm

class PMPropertyInformationViewController: XLFormViewController {

    let dataMan = PMDataManager.sharedManager
    
    var propertyInfo : PMProperty = PMProperty()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.orange
        
        self.tableView.backgroundColor = UIColor.red
        
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    private func setup() {
        
        setupForm()
        setTestData()
    }
    
    
    private func setupForm() {
        
        let form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "Some title")
        
        
        
        section = XLFormSectionDescriptor()
        
        section.title = "First section"
        
        form.addFormSection(section)
        
        row = XLFormRowDescriptor(tag: "testing", rowType: XLFormRowDescriptorTypeText, title: "Testy")
        
        row.value = self.propertyInfo.streetAddress
        
        section.addFormRow(row)
        
        self.form = form
    }
    
    
    private func setTestData() {
        
        dataMan.getPropertyWithID(propID: 1) { (prop_response) in
            
            
            self.propertyInfo = prop_response
            
            self.tableView.reloadData()
            
        }
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

