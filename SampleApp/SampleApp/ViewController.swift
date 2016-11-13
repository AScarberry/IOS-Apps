//
//  ViewController.swift
//  SampleApp
//
//  Created by Scarberry, Aaron on 11/7/16.
//  Copyright © 2016 Scarberry, Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var lowerBoundField: UITextField!
    @IBOutlet var upperBoundField: UITextField!
    
    @IBOutlet var randomButton: UIButton!
    @IBOutlet var resultLabel:UILabel!
    
    
    @IBAction func randomButton(sender:UIButton!){
        let lowerBoundNum = UInt32(lowerBoundField.text!)
        let upperBoundNum = UInt32(upperBoundField.text!)
    

        if lowerBoundNum != nil{
            if upperBoundNum != nil{
                let randNum = arc4random_uniform(upperBoundNum!-lowerBoundNum!)+lowerBoundNum!
                resultLabel.text = String(randNum)

            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

