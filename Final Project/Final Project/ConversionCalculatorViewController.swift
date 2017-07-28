//
//  ConversionCalculatorViewController.swift
//  Final Project
//
//  Created by Jeffrey Friel on 7/27/17.
//  Copyright © 2017 Jeffrey Friel. All rights reserved.
//

import UIKit

class ConversionCalculatorViewController: UIViewController {

    //class variables
    var conversionSelected : String = "mitokm"
    var convertToAbbrev : String = " Km"
    var convertFromAbbrev : String = " Mi"
    var convertFromString : String = ""
    
    var converterSelected : String = "mitokm"
    var decPoint : Bool = false
 
    //iboulets
    
    @IBOutlet weak var convertFromLabel: UILabel!
   
    @IBOutlet weak var convertToLabel: UILabel!
    
    //ibactions
    //enter number to convert
    @IBAction func numbers(_ sender: UIButton) {
        switch sender.tag {
        case 10...19:
            if convertFromString == "0"{
                convertFromString = String(sender.tag - 10)
            } else {
                convertFromString = convertFromString + String(sender.tag - 10)
            }
            
        case 20:
            if decPoint == false {
                convertFromString = convertFromString + "."
                decPoint = true
            }
            
        case 21:
            if convertFromString != "0"{
                if let convertFromNumber = Double(convertFromString){
                    if convertFromNumber.sign == .plus, convertFromNumber != 0 {
                        convertFromString = String(-abs(convertFromNumber))
                    } else {
                        convertFromString = String(abs(convertFromNumber))
                    }
                }
            }
            
        case 22:
            convertFromString = ""
            
            convertFromLabel.text = convertFromAbbrev
            convertToLabel.text = convertToAbbrev
            
            decPoint = false
            
        
        default:
            break
        }
        updateText()
    }
    
    
    
    
        
    //choose conversion type
    
    @IBAction func chooseConversion(_ sender: AnyObject) {
        let choiceAlert = UIAlertController(title: "Conversion Type", message: "Please choose type of conversion.", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        choiceAlert.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.title = "Miles to Kilometers"
            self.conversionSelected = "mitokm"
            self.convertFromAbbrev = " Mi"
            self.convertToAbbrev = " Km"
            self.updateText()
        }))
        
        choiceAlert.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.title = "Kilometers to Miles"
            self.conversionSelected = "kmtomi"
            self.convertFromAbbrev = " Km"
            self.convertToAbbrev = " Mi"
            self.updateText()
            
        }))
        
        choiceAlert.addAction(UIAlertAction(title: "Farenheit to Celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.title = "Farenheit to Celcius"
            self.conversionSelected = "ftoc"
            self.convertFromAbbrev = " F"
            self.convertToAbbrev = " C"
            self.updateText()
            
        }))
        
        choiceAlert.addAction(UIAlertAction(title: "Celcius to Farenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.title = "Celcius to Farenheit"
            self.conversionSelected = "ctof"
            self.convertFromAbbrev = " C"
            self.convertToAbbrev = " F"
            self.updateText()
            
        }))
        
        self.present(choiceAlert, animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Miles to Kilometers"
        convertFromLabel.text = self.convertFromAbbrev
        convertToLabel.text = self.convertToAbbrev
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//Update the text of the to and from labels with entered from and converted to
    func updateText(){
        convertFromLabel.text = convertFromString + convertFromAbbrev
        let converter = Converter(convertFrom: self.convertFromString, conversionType: self.conversionSelected)
        if let converted = converter.convertTo {
            let convertedString = NSString(format: "%.2f", converted) as String
            convertToLabel.text = convertedString + self.convertToAbbrev
        } else {
            convertToLabel.text = self.convertToAbbrev
        }
    }
    

 

}
