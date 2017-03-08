//
//  MasterViewController.swift
//  Test
//
//  Created by WuQiang on 2017/3/8.
//  Copyright © 2017年 WuQiang. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController?.preferredDisplayMode = .allVisible
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let file = AppData.items[indexPath.row]
        if let data = AppData.itemsData[file] {
            cell.textLabel?.text = data[0]
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let controller = segue.destination as! DetailViewController
            let path = tableView.indexPathForSelectedRow
            controller.selected = path?.row
        }
    }
}
