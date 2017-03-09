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
     var controllerHelp: UIViewController!
    
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
    // Listing 16-10: Sending the index of the selected book to PictureViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPicture" {
            let controller = segue.destination as! PictureViewController
            controller.selected = selected
        }
    }
    // Listing 16-13: Creating a modal view from code
    
    @IBAction func showHelp(_ sender: Any) {
        // Listing 16-15: Instantiating the view controller and presenting its view on the screen
        let controllerHelp = HelpViewController()
        controllerHelp.modalPresentationStyle = .pageSheet
        present(controllerHelp, animated: true, completion: nil)
        /*
         // 纯粹用代码写一个页面
         // Listing 16-13: Creating a modal view from code
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "纯粹用代码写的"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 24)
        
        let closeButton = UIButton(type: .system)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(closeHelp), for: .touchUpInside)
        
        controllerHelp = UIViewController()
        controllerHelp.modalPresentationStyle = .pageSheet
        controllerHelp.view.backgroundColor = UIColor.white
        controllerHelp.view.addSubview(label)
        controllerHelp.view.addSubview(closeButton)
        
        var constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[mylabel]-|", options: [], metrics: nil, views: ["mylabel": label])
        controllerHelp.view.addConstraints(constraints)
        constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[mybutton]-|", options: [], metrics: nil, views: ["mybutton": closeButton])
        controllerHelp.view.addConstraints(constraints)
        constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[mylabel]-20-[mybutton]", options: [], metrics: nil, views: ["mylabel": label, "mybutton": closeButton])
        controllerHelp.view.addConstraints(constraints)
        
        present(controllerHelp, animated: true, completion: nil)
 */
    }
    
    func closeHelp() {
        controllerHelp.dismiss(animated: true, completion: nil)
    }
}
