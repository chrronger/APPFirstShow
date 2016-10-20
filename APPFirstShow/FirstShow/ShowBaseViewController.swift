//
//  ShowBaseViewController.swift
//  APPFirstShow
//
//  Created by sen on 2016/10/18.
//  Copyright © 2016年 sen. All rights reserved.
//

import UIKit

class ShowBaseViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var titleLabelBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var subTitle: UILabel!
    
    @IBOutlet weak var subTitleLabelBottomConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabelBottomConstraint.constant = Ruler.iPhoneVertical(20, 30, 30, 30).value
        subTitleLabelBottomConstraint.constant = Ruler.iPhoneVertical(120, 140, 160, 180).value
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        view.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: { 
            self.view.alpha = 1
            }) { (_) in}
    }
 
    func animate(view:UIView,duration:CFTimeInterval,offset:UInt32) {
        
        let path = UIBezierPath()
        
        func flip() ->CGFloat {
            return arc4random() % 2 == 0 ? -1 : 1
        }
        
        let beginPoint = CGPoint.init(x: view.center.x + CGFloat(arc4random() % offset)*flip() , y: view.center.y + CGFloat(arc4random() % offset) * 0.5 * flip())
        
        let endPoint = CGPoint.init(x: view.center.x + CGFloat(arc4random() % offset) * flip(), y: view.center.y + CGFloat(arc4random() % offset) * 0.5 * flip())
        
        path.move(to: beginPoint)
        path.addLine(to: endPoint)
        
        repeatAnimate(view: view, path: path, duration: duration, autoreverses: true)
        repeatRotate(view: view, fromValue: -0.1 as AnyObject, toValue: 0.1 as AnyObject, duration: duration)
    }
    func repeatRotate(view: UIView, fromValue: AnyObject, toValue: AnyObject, duration: CFTimeInterval){
        let rotate = CABasicAnimation.init(keyPath: "transform.rotation.z")
        
        rotate.fromValue = fromValue
        rotate.toValue = toValue
        rotate.duration = duration
        rotate.repeatCount = Float.infinity
        rotate.autoreverses = true
        rotate.timingFunction = CAMediaTimingFunction.init(name:kCAMediaTimingFunctionEaseInEaseOut)
        
        view.layer.allowsEdgeAntialiasing = true
        
        view.layer.add(rotate, forKey: "Rotate")

    }
    
    
    func repeatAnimate(view:UIView,path:UIBezierPath,duration:CFTimeInterval,autoreverses: Bool = false){
        
        let animation = CAKeyframeAnimation.init(keyPath: "position")
        
        animation.calculationMode = kCAAnimationPaced
        animation.fillMode = kCAFillModeForwards
        animation.duration = duration
        animation.repeatCount = Float.infinity
         //是否反转变为原来的属性值
        animation.autoreverses = autoreverses
        
        if autoreverses {
            animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
            
        } else {
            animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        }
        
        animation.path = path.cgPath
        
        view.layer.add(animation, forKey: "Animation")
        
    }
    

    
}
