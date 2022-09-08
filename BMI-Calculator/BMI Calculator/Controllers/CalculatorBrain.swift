

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculatBMI (height : Float , weight : Float){
        let  bmiValue = weight/pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue , advice: "Eat more pies!", color: UIColor.blue)
        }else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue , advice: "Fit as a fiddle!", color: UIColor.green)
        }else {
            bmi = BMI(value: bmiValue , advice: "Eat less pies!", color: UIColor.systemPink)
        }
        
    }
    func getBMIValue () -> String {
        
        let bmiValue = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiValue
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    func getColor () ->UIColor {
        return bmi?.color ?? UIColor.white
    }
}


