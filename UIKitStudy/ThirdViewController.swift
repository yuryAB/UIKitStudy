//
//  ThirdViewController.swift
//  UIKitStudy
//
//  Created by yury antony on 11/08/20.
//  Copyright © 2020 yuryAntony. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    let dataSource = ["View 1","View 2","View 3","View 4",]
    var currentVCIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewController()
        pageControl.numberOfPages = dataSource.count
    }
    
    func configurePageViewController(){
        guard let pageViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: CustomPageViewController.self)) as? CustomPageViewController else{
            return
        }
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pageViewController.view)
        let views: [String: Any] =  ["pageView": pageViewController.view]
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageView]-0-|",
                                                                 options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                 metrics: nil,
                                                                 views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageView]-0-|",
                                                                 options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                 metrics: nil,
                                                                 views: views))
        
        guard let startingViewController = detailViewControllerAt(index: currentVCIndex) else {
            return
        }
        
        pageViewController.setViewControllers([startingViewController], direction:  .forward, animated: true)
        
        
    }
    
    func detailViewControllerAt(index: Int) -> DataPageViewController?{
        
        if index >= dataSource.count || dataSource.count == 0{
            return nil
        }
        
        guard let dataViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: DataPageViewController.self)) as?
            DataPageViewController else{
                return nil
        }
        
        dataViewController.index = index
        dataViewController.displayText = dataSource[index]
        return dataViewController
    }

}

extension ThirdViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentVCIndex
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return dataSource.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let dataViewController = viewController as?  DataPageViewController
        guard var currentIndex = dataViewController?.index else{
            return nil
        }
        currentVCIndex = currentIndex
        if currentIndex == 0{
            return nil
        }
        
        currentIndex -= 1
        pageControl.currentPage = currentIndex
        return detailViewControllerAt(index: currentIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let dataViewController = viewController as?  DataPageViewController
        guard var currentIndex = dataViewController?.index else{
            return nil
        }
        
        if currentIndex == dataSource.count{
            return nil
        }
       
        currentIndex += 1
         pageControl.currentPage = currentIndex
        currentVCIndex = currentIndex
        
        return detailViewControllerAt(index: currentIndex)
    }
  
}


