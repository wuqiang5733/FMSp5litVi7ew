//
//  DetailViewController.swift
//  Test
//
//  Created by WuQiang on 2017/3/8.
//  Copyright © 2017年 WuQiang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    var selected: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if selected != nil {
            let file = AppData.items[selected]
            bookCover.image = UIImage(named: file)
            if let data = AppData.itemsData[file] {
                bookTitle.text = data[0]
                bookAuthor.text = data[1]
            }
        }
    }
}
