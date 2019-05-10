//
//  ViewController.swift
//  FinalProject
//
//  Created by McEwen, Joshua A. (MU-Student) on 5/10/19.
//  Copyright © 2019 McEwen, Joshua A. (MU-Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numbOnScreen:Double = 0;
    var storeNumb:Double = 0;
    var performing = false
    var operation = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func Numbers(_ sender: UIButton) {
        if performing == true {
            label.text = String(sender.tag-1)
            numbOnScreen = Double(label.text!)!
            performing = false
        }
        else{
            label.text = label.text! + String(sender.tag-1)
            numbOnScreen = Double(label.text!)!
        }
        
        
        
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16{
            storeNumb = numbOnScreen
            switch sender.tag {
            case 12://Divide
                label.text = "/"
            case 13://multiply
                label.text = "x"
            case 14://subtract
                label.text = "-"
            case 15://add
                label.text = "+"
            default:
                label.text = ""
            }
            operation = sender.tag
            performing = true
        }
        else if sender.tag == 16{
            switch operation{
            case 12:
                numbOnScreen = storeNumb / numbOnScreen
            case 13:
                numbOnScreen = storeNumb * numbOnScreen
            case 14:
                numbOnScreen = storeNumb - numbOnScreen
            case 15:
                numbOnScreen = storeNumb + numbOnScreen
            default:
                numbOnScreen = storeNumb
            }
            label.text = String(numbOnScreen)
            
        }
        else {
            label.text = ""
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

