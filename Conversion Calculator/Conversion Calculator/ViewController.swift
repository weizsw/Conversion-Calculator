//
//  ViewController.swift
//  Conversion Calculator
//
//  Created by weizsw on 7/27/17.
//  Copyright © 2017 Shaowei Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blueDisplay: UITextField!
    @IBOutlet weak var whiteDisplay: UITextField!


    @IBOutlet weak var blueText: UITextField!

    @IBOutlet weak var whiteText: UITextField!
    
    
    var numbers: String = ""
    var choice: Int = 1
    
    @IBAction func numbers(_ sender: UIButton) {
        whiteDisplay.textAlignment = .right
        blueDisplay.textAlignment = .right
        numbers = numbers + String(sender.tag-1)
        whiteDisplay.text = numbers
        switch choice {
        case 1:
            self.blueDisplay.text = self.fToC(numbers)
        case 2:
            self.blueDisplay.text = self.cToF(numbers)
        case 3:
            self.blueDisplay.text = self.mTok(numbers)
        case 4:
            self.blueDisplay.text = self.kTom(numbers)
        default:
            self.blueDisplay.text = "default"
        }
        
    }
    
    var count = 0
    @IBAction func addDecimal(_ sender: UIButton) {

        if count == 0 {
            numbers = numbers + "."
            whiteDisplay.text = numbers
          
            count = 1
            
        }
    }
    
    
    @IBAction func clean(_ sender: UIButton) {
        if sender.tag == 11 {
            whiteDisplay.text = nil;
            blueDisplay.text = nil;
            numbers = ""
            count = 0
        }
    }
    
    
    @IBAction func minusOrPlus(_ sender: UIButton) {
        
        if numbers == ""{
            return
        }
        
        if numbers == "." {
            return
        }
        
        var new: Double
        
        if let check = Double(numbers),
            check < 0{
            
            new = abs(check)
            numbers = String(new)
            count = 1
            
        }
            
            
        else{
            numbers = "-" + numbers
        }
        
        whiteDisplay.text = numbers
        switch choice {
        case 1:
            self.blueDisplay.text = self.fToC(numbers)
        case 2:
            self.blueDisplay.text = self.cToF(numbers)
        case 3:
            self.blueDisplay.text = self.mTok(numbers)
        case 4:
            self.blueDisplay.text = self.kTom(numbers)
        default:
            self.blueDisplay.text = "default"
        }

    }
    
    
    func mTok(_ miles: String) -> String {
        
        let new: Double = Double(miles)!
        let multiplier: Double = 1.61
        
        let total = new * multiplier
        
        return String(total)
        
    }
    
    func kTom(_ kilometers: String) -> String {
        
        let new: Double = Double(kilometers)!
        let multiplier: Double = 0.62
        
        let total = new * multiplier
        
        return String(total)
        
    }
    
    
    func fToC(_ ferenheight: String) -> String {
        
        let new: Double = Double(ferenheight)!
        
        let total = (new - 32) * (5/9)
        
        return String(format: "%.2f", total )
        
    }
    
    
    func cToF(_ celcius: String) -> String {
        
        let new: Double = Double(celcius)!
        
        let total = new * (9/5) + 32
        
        return String(format: "%.2f", total )
    
    }

    @IBAction func conversion(_ sender: AnyObject) {
        
            let alert = UIAlertController(title: "choose a converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            alert.addAction(UIAlertAction(title: "fahrenheit to celcius", style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
                
                self.whiteText.text = "°F"
                self.blueText.text = "°C"
                self.choice = 1
                
                self.whiteDisplay.text = self.numbers
                if self.numbers != ""{
                    self.blueDisplay.text = self.fToC(self.numbers)
                }
             
                
                
                
            }))
            
            alert.addAction(UIAlertAction(title: "celcius to fahrenheit", style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
                
                self.whiteText.text = "°C"
                self.blueText.text = "°F"
                
                self.choice = 2
                
                self.whiteDisplay.text = self.numbers
                if self.numbers != ""{
                    self.blueDisplay.text = self.cToF(self.numbers)
                }
               
         
                
            }))
            
            alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
                
                self.whiteText.text = "mi"
                self.blueText.text = "km"
                
                self.choice = 3
                
                self.whiteDisplay.text = self.numbers
                if self.numbers != ""{
                    self.blueDisplay.text = self.mTok(self.numbers)
                }
            }))
            
            alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
                
                self.whiteText.text = "km"
                self.blueText.text = "mi"
                
                self.choice = 4
                
                self.whiteDisplay.text = self.numbers
                if self.numbers != ""{
                    self.blueDisplay.text = self.kTom(self.numbers)
                }
                
            }))
        
            self.present(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.whiteText.text = "°F"
        self.blueText.text = "°C"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

