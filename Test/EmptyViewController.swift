//
//  EmptyViewController.swift
//  Test
//
//  Created by WuQiang on 2017/3/9.
//  Copyright © 2017年 WuQiang. All rights reserved.
//

import UIKit

class EmptyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = splitViewController?.displayModeButtonItem
        navigationItem.leftBarButtonItem = button
        /*
         because Navigation Bars hide the Back button when
         other buttons are present on the same side, we also have to modify the
         leftItemsSupplementBackButton property to tell the Navigation Bar to present
         both buttons at the same time
         */
        navigationItem.leftItemsSupplementBackButton = true
    }
}
