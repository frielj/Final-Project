//
//  Converter.swift
//  Final Project
//
//  Created by Jeffrey Friel on 7/28/17.
//  Copyright © 2017 Jeffrey Friel. All rights reserved.
//

import Foundation

struct Converter {
    var convertFrom : Double?
    var convertTo : Double?
    let conversionType : String?
    
    
    init(convertFrom : String, conversionType : String) {
        self.conversionType = conversionType
        if let convertFrom = Double(convertFrom){
            self.convertFrom = convertFrom
            switch conversionType {
                case "mitokm":
                    self.convertTo = milesToKilometers(convertFrom: self.convertFrom!)
                
                case "kmtomi":
                    convertTo = kilometersToMiles(convertFrom: self.convertFrom!)
                
                case "ftoc":
                    convertTo = farenheitToCelcius(convertFrom: self.convertFrom!)
                
                case "ctof":
                    convertTo = celciusToFarenheit(convertFrom: self.convertFrom!)
                default:
                    break
                
            }
        }
    }
    
    func milesToKilometers(convertFrom : Double) -> Double {
        return self.convertFrom! * 1.60934
    }
    
    func kilometersToMiles(convertFrom : Double) -> Double {
        return self.convertFrom!/1.60934
    }
    
    func farenheitToCelcius(convertFrom : Double) -> Double {
        return (self.convertFrom! - 32)*5/9
    }
    
    func celciusToFarenheit(convertFrom : Double) -> Double {
        return (self.convertFrom! * 9/5)+32
    }
}
