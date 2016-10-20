//
//  ShowOneViewController.swift
//  APPFirstShow
//
//  Created by sen on 2016/10/18.
//  Copyright © 2016年 sen. All rights reserved.
//

import UIKit

class ShowOneViewController: ShowBaseViewController {

    @IBOutlet weak var rightPurpleDot: UIImageView!
    @IBOutlet weak var rightBlueDot: UIImageView!
    @IBOutlet weak var leftGreenDot: UIImageView!
    @IBOutlet weak var leftPurpleDot: UIImageView!
    @IBOutlet weak var leftRedDot: UIImageView!
    @IBOutlet weak var leftBlueDot: UIImageView!
    @IBOutlet weak var rightYellowDot: UIImageView!
    @IBOutlet weak var rightGreenDot: UIImageView!
    @IBOutlet weak var topRedDot: UIImageView!
    
    @IBOutlet weak var centBlueDot: UIImageView!
   
    @IBOutlet weak var centerOrangeDot: UIImageView!
    
    @IBOutlet weak var dotsLink: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "第一页"//NSLocalizedString("Genius", comment: "")
        subTitle.text = "这是第一页"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        oneViewControllerAnimate()
    }

    func oneViewControllerAnimate (){
        repeatAnimate(view: rightPurpleDot, path: UIBezierPath(ovalIn: rightPurpleDot.frame.insetBy(dx: 2, dy: 2)), duration: 4)
        repeatAnimate(view: leftGreenDot, path: UIBezierPath(ovalIn: leftGreenDot.frame.insetBy(dx: 5, dy: 5)), duration: 2.5)
        repeatAnimate(view: leftBlueDot, path: UIBezierPath(ovalIn: leftBlueDot.frame.insetBy(dx: 3, dy: 3)), duration: 4)
        repeatAnimate(view: leftRedDot, path: UIBezierPath(ovalIn: leftRedDot.frame.insetBy(dx: 3, dy: 3)), duration: 1.5)
        repeatAnimate(view: leftPurpleDot, path: UIBezierPath(ovalIn: leftPurpleDot.frame.insetBy(dx: 1, dy: 1)), duration: 6)
        repeatAnimate(view: topRedDot, path: UIBezierPath(ovalIn: topRedDot.frame.insetBy(dx: 1, dy: 1)), duration: 2)
        repeatAnimate(view: rightBlueDot, path: UIBezierPath(ovalIn: rightBlueDot.frame.insetBy(dx: 1, dy: 1)), duration: 3)
        repeatAnimate(view: centBlueDot, path: UIBezierPath(ovalIn: centBlueDot.frame.insetBy(dx: 1, dy: 1)), duration: 3)
        repeatAnimate(view: centerOrangeDot, path: UIBezierPath(ovalIn: centerOrangeDot.frame.insetBy(dx: 1, dy: 1)), duration: 3)
        repeatAnimate(view: rightYellowDot, path: UIBezierPath(ovalIn: rightYellowDot.frame.insetBy(dx: 1, dy: 1)), duration: 3)
        repeatAnimate(view: rightGreenDot, path: UIBezierPath(ovalIn: rightGreenDot.frame.insetBy(dx: 1, dy: 1)), duration: 3)
        
        let dotsLinkPath = UIBezierPath(arcCenter: dotsLink.center, radius: 5, startAngle: 0, endAngle: 2, clockwise: false)
        repeatAnimate(view: dotsLink, path: dotsLinkPath, duration: 7, autoreverses: true)
    }
    
}
