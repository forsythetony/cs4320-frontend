//
//  PMPropertiesListView.swift
//  property_management_app
//
//  Created by Tony Forsythe on 11/2/17.
//  Copyright © 2017 Tony Forsythe. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import AlamofireImage

class PMPropertiesListView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    private let CELLS_PER_ROW = 1;
    private let CELL_PADDING = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
    
    lazy var properties = [PMProperty]()
    let dataMan = PMDataManager.sharedManager
    
    private var listView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.yellow
        
        setupCollectionView()
        loadProps()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func setupCollectionView() {
        
        let colView = UICollectionView(frame: self.view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        
        
        self.view.addSubview(colView)
        
        colView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        colView.delegate = self
        colView.dataSource = self
        
        colView.register(UINib.init(nibName: "JMPropertyCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: JMPropertyCollectionViewCell.REUSE_ID)
        
        
        
        colView.backgroundColor = UIColor.PMPatternBackgroundOne
        self.listView = colView
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return properties.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JMPropertyCollectionViewCell.REUSE_ID, for: indexPath) as? JMPropertyCollectionViewCell else { return UICollectionViewCell()}
        
        
        
        
        let prop = properties[indexPath.item]
        
        
        cell.lbl.text = prop.streetAddress
        
        if let urlString = URL(string: prop.imageURLMain) {
            
            cell.imgView.af_setImage(withURL: urlString)
        }
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let dim = (self.view.frame.size.width / CGFloat(CELLS_PER_ROW)) - (CELL_PADDING.totalWidth)
        
        
        let heightMod = 0.25
        
        let height = self.view.frame.size.height * heightMod.CGFloatValue
        
        return CGSize(width: dim, height: height)
    }
    
    
    private func loadProps() {
        
        
        dataMan.getPropertiesForUser(userID: 1) { (props) in
            
            self.properties = props
            self.listView.reloadData()
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
