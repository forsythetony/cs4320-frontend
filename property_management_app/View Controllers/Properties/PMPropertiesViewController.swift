//
//  PMPropertiesViewController.swift
//  property_management_app
//
//  Created by Tony Forsythe on 11/2/17.
//  Copyright © 2017 Tony Forsythe. All rights reserved.
//

import UIKit
import SnapKit

class PMPropertiesViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    
    var pageViewController : UIPageViewController!
    var segmentedController : UISegmentedControl!
    private let dataManager = PMDataManager.sharedManager
    
    var pageViewControllers : [UIViewController] = {
        
        let mapController = PMPropertiesMapView()
        let listController = PMPropertiesListView()
        
        return [mapController, listController]
    
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupTabBarItem()
        setupSegmentedControl()
        setupPageViewController()
        getProperties()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setInitialSegmentedIndex(index: 1)
    }
    
    private func getProperties() {
        
        dataManager.getPropertiesForUser(userID: 1) { result in
            
            printAllProperties(props: result)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    private func setupSegmentedControl() {
        
        let segmentedControl = UISegmentedControl(items: ["Map", "List"])
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedValueDidUpdate(sender:)), for: .valueChanged)
        
        self.view.addSubview(segmentedControl)
        
        segmentedControl.snp.makeConstraints { (make) in
            make.height.equalTo(segmentedControl.frame.size.height)
            make.left.equalTo(self.view).offset(20.0)
            make.top.equalTo(self.view.snp.topMargin).offset(10.0)
            make.right.equalTo(self.view).offset(-20.0)
        }
        
        self.segmentedController = segmentedControl
        
       
    }
    
    func setInitialSegmentedIndex( index : Int) {
        
        self.segmentedController.selectedSegmentIndex = index
        
        let vc = self.pageViewControllers[index]
        
        self.pageViewController.setViewControllers([vc], direction: .forward, animated: false, completion: nil)
    }
    @objc func segmentedValueDidUpdate( sender : UISegmentedControl) {
        
        let vc = self.pageViewControllers[sender.selectedSegmentIndex]
        
        self.pageViewController.setViewControllers([vc], direction: .forward, animated: false, completion: nil)
        
    }
    
    private func setupPageViewController() {
        
        let pageViewCtrl = UIPageViewController()
        
        
        pageViewCtrl.dataSource = self
        pageViewCtrl.delegate = self
        
        pageViewCtrl.setViewControllers([self.pageViewControllers.first!], direction: .forward, animated: true, completion: nil)
        
        
        addChildViewController(pageViewCtrl)
        
        view.addSubview(pageViewCtrl.view)
        pageViewCtrl.didMove(toParentViewController: self)
        
        pageViewCtrl.view.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.top.equalTo(self.segmentedController.snp.bottom).offset(10.0)
            make.bottom.equalTo(self.view)
        }
        
        
        self.pageViewController = pageViewCtrl
        
    }

    private func setupTabBarItem() {
        
        let tabBarImage = PMIconGenerator.getTabBarImageForTabBarItem(item: .PropertiesScreen)
        let tabBarTitle = "Properties"
        
        self.tabBarItem = UITabBarItem(title: tabBarTitle, image: tabBarImage, selectedImage: tabBarImage)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index : Int = self.pageViewControllers.index(of: viewController) else { return nil }
        
        if index >= (self.pageViewControllers.count - 1) {
            return nil
        }
        else {
            return self.pageViewControllers[index + 1]
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index : Int = self.pageViewControllers.index(of: viewController) else { return nil }
        
        if index == 0 {
            return nil
        }
        else {
            return pageViewControllers[index - 1]
        }
    }
}


extension PMPropertiesViewController {
    
    
    
    
}

