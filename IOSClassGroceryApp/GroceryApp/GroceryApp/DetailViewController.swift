//
//  DetailViewController.swift
//  GroceryApp
//
//  Created by Scarberry, Aaron on 11/27/16.
//  Copyright © 2016 Scarberry, Aaron. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet var itemLabel: UILabel?
    @IBOutlet var quantityLabel: UILabel?
    
    var manager = DataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = manager.getSelectedData()
        itemLabel?.text = item?.item
        quantityLabel?.text = "Quantity: \(item?.quantity ?? 0)"
    }

}
