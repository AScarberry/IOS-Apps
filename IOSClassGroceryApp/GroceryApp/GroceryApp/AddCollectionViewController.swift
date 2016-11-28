//
//  AddCollectionViewController.swift
//  GroceryApp
//
//  Created by Scarberry, Aaron on 11/27/16.
//  Copyright © 2016 Scarberry, Aaron. All rights reserved.
//

import UIKit

class AddCollectionViewController: UIViewController {

        @IBOutlet var listNameField: UITextField?
        
        let manager = DataManager.shared
        
        @IBAction func addCollectionData() {
            try? manager.createCollection(collectionName: listNameField?.text)
            dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
        }
        
        @IBAction func cancel() {
            dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
        }
        
    }


