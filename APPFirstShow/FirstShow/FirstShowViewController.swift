//
//  FirstShowViewController.swift
//  APPFirstShow
//
//  Created by sen on 2016/10/18.
//  Copyright © 2016年 sen. All rights reserved.
//

import UIKit

class FirstShowViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var pageC: UIPageControl!
    
    @IBOutlet weak var register: UIButton!
    
    @IBOutlet weak var login: UIButton!
    
    private var shows = [UIViewController]()
    
    private var isFirstAppear = true
    
     let storyBoard = UIStoryboard.init(name: "FirstShow", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //navigationController?.setNavigationBarHidden(true, animated: true)
        if isFirstAppear {
            scrollview.alpha = 0
            pageC.alpha = 0
            register.alpha = 0
            login.alpha = 0
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if isFirstAppear {
            UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseInOut, animations: {
                self.scrollview.alpha = 1
                self.pageC.alpha = 1
                self.register.alpha = 1
                self.login.alpha = 1
                }, completion: { (_) in})
        }
        
        isFirstAppear = false;
    }
    
    
    private func setupUI(){
        
        scrollview.delegate = self
        
        let one = setupOne()
        let two = setupTwo()
        let three = setupThree()
        
        shows = [one,two,three]
        
        pageC.numberOfPages = shows.count
        pageC.pageIndicatorTintColor = UIColor.init(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        pageC.currentPageIndicatorTintColor = UIColor.init(red: 50/255.0, green: 167/255.0, blue: 255/255.0, alpha: 1.0)
        
        register.setTitle("注册", for: .normal)
        register.backgroundColor = UIColor.init(red: 50/255.0, green: 167/255.0, blue: 255/255.0, alpha: 1.0)
        
        login.setTitle("登录", for: .normal)
        login.setTitleColor(UIColor.init(red: 0.557, green: 0.557, blue: 0.576, alpha: 1.0), for: .normal)
        
        let views:[String:Any] = [
            "view":view,
            "one":one.view,
            "two":two.view,
            "three":three.view
        ]
        
        let vConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|[one(==view)]|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(vConstraint)
        let hConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|[one(==view)][two(==view)][three(==view)]|", options: [.alignAllBottom,.alignAllTop], metrics: nil, views: views)
        NSLayoutConstraint.activate(hConstraint)
        
    }
    
    private func setupOne() ->ShowOneViewController{
        let one = storyBoard.instantiateViewController(withIdentifier: "ShowOneViewController")
        one.view.translatesAutoresizingMaskIntoConstraints = false
        scrollview.addSubview(one.view)
        
        addChildViewController(one)
        //will move
        one.didMove(toParentViewController: self)
        return one as! ShowOneViewController
    }
    
    private func setupTwo() ->ShowTwoViewController{
        let two = storyBoard.instantiateViewController(withIdentifier: "ShowTwoViewController")
        two.view.translatesAutoresizingMaskIntoConstraints = false
        scrollview.addSubview(two.view)
        addChildViewController(two)
        two.didMove(toParentViewController: self)
        return two as! ShowTwoViewController
    }
    
    private func setupThree() ->ShowThreeViewController{
        let three = storyBoard.instantiateViewController(withIdentifier: "ShowThreeViewController")
        three.view.translatesAutoresizingMaskIntoConstraints = false
        scrollview.addSubview(three.view)
        addChildViewController(three)
        three.didMove(toParentViewController: self)
        return three as! ShowThreeViewController
    }
    
    //MARK:delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollview.bounds.width
        
        let pageFraction = scrollview.contentOffset.x / pageWidth
        //round:四舍五入
        let page = Int(round(pageFraction))
        
        pageC.currentPage = page
    }
    
    @IBAction func register(_ sender: AnyObject) {
       // present(RegisterViewController(), animated: true, completion: nil)
    }

    @IBAction func login(_ sender: AnyObject) {
        //present(LoginViewController(), animated: true, completion: nil)

    }
   

}
