//
//  PopoverViewController.swift
//  Test
//
//  Created by WuQiang on 2017/3/10.
//  Copyright © 2017年 WuQiang. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
    @IBOutlet weak var messageLabel: UILabel!
    var selected: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var author = ""
        if selected != nil {
            let file = AppData.items[selected]
            if let data = AppData.itemsData[file] {
                author = data[1]
            }
            let search = AppData.itemsData.filter({ (item) in
                let data = item.1
                if data[1] == author {
                    return true
                }
                return false
            })
            let total = search.count
            messageLabel.text = "We have \(total) books from this author"
        }
    }
    
    // Listing 16-24: Implementing the protocol's methods
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
