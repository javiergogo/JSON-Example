//
//  ViewController.swift
//  23 JSON Example
//
//  Created by Javier Gomez on 1/25/16.
//  Copyright © 2016 JDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string: "https://freegeoip.net/json/")!
    
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if let urlContent = data
            {
                //print(urlContent)
                do {
                    let jsonresult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                        //si quiero imprimir toda la informacion            print (jsonresult)
                        print(jsonresult["city"])
                } catch {       print("JSON serialization was wrong")        }
            }
        }
        
        task.resume()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

