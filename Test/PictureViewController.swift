//
//  PictureViewController.swift
//  Test
//
//  Created by WuQiang on 2017/3/9.
//  Copyright © 2017年 WuQiang. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {
    @IBOutlet weak var bookCover: UIImageView!
    var selected: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if selected != nil {
            let file = AppData.items[selected]
            bookCover.image = UIImage(named: file)
        }
    }
}
