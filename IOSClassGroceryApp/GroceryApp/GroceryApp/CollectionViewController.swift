//
//  CollectionViewController.swift
//  GroceryApp
//
//  Created by Scarberry, Aaron on 11/27/16.
//  Copyright © 2016 Scarberry, Aaron. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var collectionTableView: UITableView?
    
    var manager = DataManager.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        manager.loadCollectionData()
        collectionTableView?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return manager.collectionCount
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = manager.getCollectionName(from: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
        
//        manager.selectCollectionIndex = indexPath.row
    }
}
