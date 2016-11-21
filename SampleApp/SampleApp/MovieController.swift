//
//  MovieController.swift
//  SampleApp
//
//  Created by Scarberry, Aaron on 11/20/16.
//  Copyright © 2016 Scarberry, Aaron. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MovieController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   
    var data: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = json[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
     
    */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "data", ofType: "json")
        let jsonData = NSData(contentsOfFile:path!)
        let json = JSON(data: jsonData! as Data)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
