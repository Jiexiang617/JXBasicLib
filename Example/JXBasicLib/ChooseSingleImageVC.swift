//
//  ChooseSingleImageVC.swift
//  JXBasicLib
//
//  Created by Jiexiang on 2017/8/18.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import UIKit
import JXBasicLib

class ChooseSingleImageVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func camera(_ sender: UIButton) {
        chooseSinglePhoto(withEdit: true, chooseWay: .camera, imageBlock: {
            self.imageView.image = $0
        })
    }

    
    @IBAction func album(_ sender: UIButton) {
        chooseSinglePhoto(withEdit: false, chooseWay: .album, imageBlock: {
            self.imageView.image = $0
        })
    }
}
