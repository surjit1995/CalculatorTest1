//
//  ViewController.swift
//  Calculator
//
//  Created by MacStudent on 2019-10-29.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit                                             // provides framework to run GUI applications



class ViewController: UIViewController {                // class viewController extends from                                                                                                UIViewController
    
    // data members
    
    var previousNumber = 0.0                            //12  number that we entered before the                     operator is stored                                                 in this variable
    var operation = 0                                   // +
    var numberOnScreen : Double = 0                    //15   number that we entered after the operator that is currently on the screen
    
    @IBOutlet weak var label: UILabel!                 // outlet for showing results
    
    
    @IBAction func numbers(_ sender: UIButton)         // method to get numbers from screen
    {
        
        
        
        if sender.tag == 12                            // tag 12 = Decimal
            
        {
            if (label.text?.contains("."))!{           // validation so that te user do not enter more than one decimal
                return
            } else if(label.text! == ""){
                label.text = "0" + String(".")
            } else {
                label.text = label.text! + String(".")
            }
        }
        else{
            if(label.text == "0"){
                label.text = ""
            }
            label.text = label.text! +  String(sender.tag)
        }
        
        numberOnScreen = Double(label.text!) ?? 0.0            //  check whether the result is in double or not                                                            and convert it into double
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if  label.text != "" && sender.tag != 10 && sender.tag != 17          // tag 10 = clear button(AC) tag 17 = equal button(=)
        {
//           previousNumber = numberOnScreen
           previousNumber = Double(label.text!)!
            label.text = ""
            operation = sender.tag
            
        }
            
        else if sender.tag == 17                                               //tag 17 = equal to button
        {
            
            var resultNum : Double! = 0.0                                       // variable to store the calculations
            if operation == 13                                                  // tag 13 = Division
            {
                resultNum = previousNumber / numberOnScreen
                print("Division")
                
            }
            else if operation == 14                                             // tag 14 = Multiply
            {
                resultNum = previousNumber * numberOnScreen
                print("Multiplication")
                
            }
            else if operation == 15                                             // tag 15 = Subtraction
            {
                resultNum = previousNumber - numberOnScreen
                print("subtraction")
            }
            else if operation == 16                                             // tag 16 = Addition
            {
                resultNum = previousNumber + numberOnScreen
                print("Addition")
            }
            else if operation == 11                                            // tag 11 = percentage
            {
                resultNum = previousNumber / 100
                print("Percentage")
            }
            roundOff(num : resultNum)
        }
        else if sender.tag == 10                                              // tag 10 = clear button (AC)
        {
            label.text = "0"
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    func roundOff(num: Double) {                                             // method to round off the output
        if num.rounded(.up) == num.rounded(.down) {
            guard !(num.isNaN || num.isInfinite)
                else {
                    label.text = "Inf"
                    return                                                   // or do some error handling
            }
            let result = Int(num)
            label.text = String(result)
            self.numberOnScreen = Double(result)
        } else {
            label.text = String(num)
        }
    }
    
    override func viewDidLoad() {    //method override from parent class to view the GUI
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}


