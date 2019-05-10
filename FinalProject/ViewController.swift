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
    var equationSoFar:Double = 0
    var enteredCounter = 0;
    
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
    
    @IBAction func decimal(_ sender: UIButton) {
        if performing == true {
            label.text = "."
            performing = false
        }else{
            label.text = label.text! + "."}
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 20{
            
            if enteredCounter >= 2{
                switch operation{
                case 12:
                    equationSoFar = equationSoFar / numbOnScreen
                case 13:
                    equationSoFar = equationSoFar * numbOnScreen
                case 14:
                    equationSoFar = equationSoFar - numbOnScreen
                case 15:
                    equationSoFar = equationSoFar + numbOnScreen
                default:
                    numbOnScreen = storeNumb
                }
                operation = sender.tag
                
            }else if enteredCounter == 1{
                
                switch operation{
                case 12:
                    equationSoFar = storeNumb / numbOnScreen
                case 13:
                    equationSoFar = storeNumb * numbOnScreen
                case 14:
                    equationSoFar = storeNumb - numbOnScreen
                case 15:
                    equationSoFar = storeNumb + numbOnScreen
                default:
                    numbOnScreen = storeNumb
                }
                operation = sender.tag
            }else {
                storeNumb = numbOnScreen
                operation = sender.tag
            }
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
            
            performing = true
           
            enteredCounter = enteredCounter + 1
    
        }
        else if sender.tag == 16{
            if enteredCounter == 1{
            switch operation{
            case 12:
                equationSoFar = storeNumb / numbOnScreen
            case 13:
                equationSoFar = storeNumb * numbOnScreen
            case 14:
                equationSoFar = storeNumb - numbOnScreen
            case 15:
                equationSoFar = storeNumb + numbOnScreen
            default:
                numbOnScreen = storeNumb
            }
            }else {
                switch operation{
                case 12:
                    equationSoFar = equationSoFar / numbOnScreen
                case 13:
                    equationSoFar = equationSoFar * numbOnScreen
                case 14:
                    equationSoFar = equationSoFar - numbOnScreen
                case 15:
                    equationSoFar = equationSoFar + numbOnScreen
                default:
                    numbOnScreen = storeNumb
                }
            }
            label.text = String(equationSoFar)
        }
        else if sender.tag == 11 {
            label.text = ""
        }
        else if sender.tag == 20 {
            label.text = ""
            storeNumb = 0
            equationSoFar = 0
            enteredCounter = 0
        }else{
            label.text = "enter #"
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

