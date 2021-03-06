//
//  ViewController.swift
//  df-pageviewcontroller-ios
//
//  Created by pikachu987 on 01/07/2019.
//  Copyright (c) 2019 pikachu987. All rights reserved.
//

import UIKit
import df_pageviewcontroller_ios

class ViewController: UIViewController {
    @IBOutlet weak var pageButtonGroupView: PageButtonGroupView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    // 페이지 뷰컨트롤러
    private var pageViewController: PageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.pageButtonGroupView.append(contentsOf: ["첫번째", "두번째", "세번째"])
        self.pageControl.numberOfPages = 3
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pageViewController = segue.destination as? PageViewController {
            pageViewController.pageViewDelegate = self
            self.pageViewController = pageViewController
            var viewControllers = [UIViewController]()
            let viewController1 = UIViewController()
            viewController1.view.backgroundColor = .orange
            let viewController2 = UIViewController()
            viewController2.view.backgroundColor = .red
            let viewController3 = UIViewController()
            viewController3.view.backgroundColor = .green
            viewControllers.append(viewController1)
            viewControllers.append(viewController2)
            viewControllers.append(viewController3)
            //            pageViewController.setDataSource()
            //            pageViewController.isReload = true
            pageViewController.initView(viewControllers, pageButtonGroupView: self.pageButtonGroupView)
        }
    }
    
}

// MARK: PageViewControllerDelegate
extension ViewController: PageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, count: Int) {
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, index: Int) {
        self.pageControl.currentPage = index
    }
    func pageViewControllerScrollToTop(_ visibleController: UIViewController?, index: Int) {
        
    }
    func pageButtonGroupViewButtonSelectedButton(_ button: UIButton) {
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    }
    func pageButtonGroupViewButtonUnselectedButton(_ button: UIButton) {
        button.setTitleColor(UIColor.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
}
