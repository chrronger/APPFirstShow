//
//  ShowOTwoViewController.swift
//  APPFirstShow
//
//  Created by sen on 2016/10/18.
//  Copyright © 2016年 sen. All rights reserved.
//

import UIKit

class ShowTwoViewController: ShowBaseViewController {

    @IBOutlet weak var camera: UIImageView!
    @IBOutlet weak var pen: UIImageView!
    @IBOutlet weak var controller: UIImageView!
    @IBOutlet weak var keyboard: UIImageView!
    @IBOutlet weak var book: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "第二页"//NSLocalizedString("Match", comment: "")
        subTitle.text = "这是第二页"//NSLocalizedString("Match friends with your skills", comment: "")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        twoViewControllerAnimate()
    }

    func twoViewControllerAnimate(){
        animate(view: camera, duration: 4, offset: 10)
        animate(view: pen, duration: 5, offset: 5)
        animate(view: book, duration:3,offset: 10)
        animate(view: controller, duration: 2, offset: 15)
        animate(view: keyboard, duration: 4, offset: 20)
    }

}
