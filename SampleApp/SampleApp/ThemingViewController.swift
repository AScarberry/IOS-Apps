//
//  ThemingViewController.swift
//  SampleApp
//
//  Created by Scarberry, Aaron on 11/14/16.
//  Copyright © 2016 Scarberry, Aaron. All rights reserved.
//

import UIKit

class ThemingViewController: UIViewController {

    @IBOutlet var darkTheme:UIColor?
    @IBOutlet var lightTheme:UIColor?

    @IBOutlet var themeLabel:UILabel?
    @IBOutlet var stepsLabel:UILabel?
    
    @IBOutlet var modalLabel:UILabel?
    
    
    @IBAction func themeButton(sender:UISwitch){
        
        guard sender.isOn else {
            themeLabel!.text! = "Light Theme"
            themeLabel!.textColor = UIColor.white
            stepsLabel!.textColor = UIColor.white
            modalLabel!.textColor = UIColor.black
            self.view.backgroundColor = lightTheme
            return
        }
        themeLabel!.text! = "Dark Theme"
        themeLabel!.textColor = UIColor.black
        stepsLabel!.textColor = UIColor.black
        modalLabel!.textColor = UIColor.white
        self.view.backgroundColor = darkTheme
        return

    }
    
    @IBAction func alert(){
        
        let viewAlert = UIAlertController(title:"ALERT!", message:"ALERTS AND STUFF!",preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        viewAlert.addAction(defaultAction)
        
        present(viewAlert, animated: true, completion: nil)
    }
    
    @IBAction func actionSheet(sender: AnyObject)
    {
         let viewActionSheet = UIAlertController(title:"ALERT!", message:"ALERTS AND STUFF!",preferredStyle: .actionSheet)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        viewActionSheet.addAction(defaultAction)
        
        present(viewActionSheet, animated: true, completion: nil)
    }
    
    @IBAction func stepCount(sender:UIStepper){
        stepsLabel!.text! = "Steps: "+Int(sender.value).description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stepsLabel!.text! = "Steps: "
        themeLabel!.text! = "Light Theme"
        
        darkTheme = UIColor.black
        lightTheme = UIColor.white
        
        themeLabel!.text! = "Light Theme"
        themeLabel!.textColor = UIColor.white
        stepsLabel!.textColor = UIColor.white
        modalLabel!.textColor = UIColor.black
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}
