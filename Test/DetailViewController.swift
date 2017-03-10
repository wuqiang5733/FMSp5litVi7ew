//
//  DetailViewController.swift
//  Test
//
//  Created by WuQiang on 2017/3/8.
//  Copyright © 2017年 WuQiang. All rights reserved.
//

import UIKit

// class DetailViewController: UIViewController {
    // Listing 16-19: Showing an alternative modal view
class DetailViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
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
            // Listing 16-20: Preparing the popover
        }else if segue.identifier == "showPopover" {
            let controller = segue.destination as! PopoverViewController
            controller.selected = selected
            
            // Listing 16-22: Moving the anchor point
            let presentation = controller.presentationController as! UIPopoverPresentationController
            let frame = presentation.sourceView?.bounds
            presentation.sourceRect = frame!
            
            // Listing 16-23: Assigning the delegate
            controller.presentationController?.delegate = controller
        }
    }
    // Listing 16-13: Creating a modal view from code
    
    @IBAction func showHelp(_ sender: Any) {
        // 从 storyboard 当中实例化
        // Listing 16-17: Instantiating the view from the Storyboard
        if let story = storyboard {
            let controllerHelp = story.instantiateViewController(withIdentifier: "helpView") as! SingleViewController
            // Listing 16-19: Showing an alternative modal view
            // controllerHelp.modalPresentationStyle = .pageSheet
            
            controllerHelp.modalPresentationStyle = .formSheet
            /*
             当一个modal view 被创建并且呈现时，
             一个 UIPresentationController类的对象
             被自动创建来管理呈现，它会被赋于给正在呈现 modal View 的 View Controller 的叫作
             presentationController的属性，通过这个属性，我们可以访问这个对象，并且阅读它当前的配置。
             */
            let presentation = controllerHelp.presentationController
            presentation?.delegate = self
            
            present(controllerHelp, animated: true, completion: nil)
        }
        /*
         // 在 xib 当中创建
        // Listing 16-15: Instantiating the view controller and presenting its view on the screen
        let controllerHelp = HelpViewController()
        controllerHelp.modalPresentationStyle = .pageSheet
        present(controllerHelp, animated: true, completion: nil)
 */
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
    
     // Listing 16-17: Instantiating the view from the Storyboard
     // Portrait 模式下是有 Visual Effect 效果的
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        /*
         —This
         method is called on the delegate to know the presentation style to use when the
         horizontal Size Class becomes compact.
         */
        print("WQ_adaptivePresentationStyle")
        return .overFullScreen
    }
    func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        /*
         —This method is called on the delegate to get the
         view controller to present for the style determined by the second attribute. The
         method is used to assign a different view to each presentation style.
         */
        // 就是在 水平方向上是 compact 时，载入这个 view Controller
        var controller: iPhoneViewController!
        if style == .overFullScreen {
            if let story = storyboard {
                controller = story.instantiateViewController(withIdentifier: "iPhoneView") as! iPhoneViewController
            }
        }
        print("WQ_presentationController")
        return controller
    }
}
