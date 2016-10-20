//
//  ShowOThreeViewController.swift
//  APPFirstShow
//
//  Created by sen on 2016/10/18.
//  Copyright © 2016年 sen. All rights reserved.
//

import UIKit

class ShowThreeViewController: ShowBaseViewController {

    @IBOutlet weak var purpleTriangle: UIImageView!
    @IBOutlet weak var greenTriangle: UIImageView!
    @IBOutlet weak var yellowTriangle: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "第三页"//NSLocalizedString("Meet", comment: "")
        subTitle.text = "这是第三页" //String.trans_subtitleBuildWorldTogether
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        threeViewControllerAnimate()
      
    }

    func threeViewControllerAnimate(){
        animate(view: yellowTriangle, duration: 3, offset: 3)
        animate(view: greenTriangle, duration: 2, offset: 7)
        animate(view: purpleTriangle, duration: 2, offset: 5)

    }
}
