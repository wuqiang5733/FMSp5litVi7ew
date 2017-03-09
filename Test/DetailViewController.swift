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
        
        // Listing 16-6: Adding a Display Mode Button to the Navigation Bar of the second Detail view
        let button = splitViewController?.displayModeButtonItem
        navigationItem.leftBarButtonItem = button
        /*
         because Navigation Bars hide the Back button when
         other buttons are present on the same side, we also have to modify the
         leftItemsSupplementBackButton property to tell the Navigation Bar to present
         both buttons at the same time
         */
        navigationItem.leftItemsSupplementBackButton = true
        
        // Listing 16-5: Selecting the book by default
        if selected == nil && !AppData.items.isEmpty {
            selected = 0
        }
        
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
