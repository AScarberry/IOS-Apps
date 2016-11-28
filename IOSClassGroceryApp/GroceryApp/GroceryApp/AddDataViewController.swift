//
//  AddDataViewController.swift
//  GroceryApp
//
//  Created by Scarberry, Aaron on 11/27/16.
//  Copyright © 2016 Scarberry, Aaron. All rights reserved.
//

import UIKit

class AddDataViewController: UIViewController {
    @IBOutlet var itemField: UITextField?
    @IBOutlet var quantityField: UITextField?
    
    let manager = DataManager.shared
    
    @IBAction func addData() {
        try? manager.create(data: (itemField?.text, quantityField?.text?.integer ?? 0))
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
    
    @IBAction func cancel() {
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }

}


extension String {
    var integer: Int? {
        return Int(self)
    }

}
