//
//  TableViewController.swift
//  FxpalBrowser
//
//  Created by Yulius Tjahjadi on 10/16/19.
//  Copyright © 2019 White Tea LLC. All rights reserved.
//

import UIKit

class TableViewController : UITableViewController {
    var items: [String] = ["One", "Two", "Three"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User selected table row \(indexPath.row) and item \(items[indexPath.row])")
    }
}
