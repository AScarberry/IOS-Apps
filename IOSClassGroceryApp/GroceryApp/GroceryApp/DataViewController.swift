//
//  DataViewController.swift
//  GroceryApp
//
//  Created by Scarberry, Aaron on 11/27/16.
//  Copyright © 2016 Scarberry, Aaron. All rights reserved.
//

import UIKit

class DataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var dataTableView: UITableView?
    
    let manager = DataManager.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        manager.data = manager.fetch()
        dataTableView?.reloadData()
    }
    
    // MARK: - Table View
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.dataCount
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = manager.getData(from: indexPath)
        cell.textLabel?.text = item?.item
        cell.detailTextLabel?.text = "Quantity: \(item?.quantity ?? 0)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
        
        manager.selectedIndex = indexPath.row
    }

}
