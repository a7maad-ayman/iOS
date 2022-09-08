import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected  = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast()) //remove precent sing "%"
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)! //turn the string num to double
        tip = buttonTitleAsANumber / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value) // show the setter num on the label
        numberOfPeople = Int(sender.value) // make it as int for macking operators on it
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text! //get the amout from user
        if bill != "" { //if it no equal to an empty string
            billTotal = Double(bill)! // turn it to double
            let result = billTotal * (1 + tip) / Double(numberOfPeople) // and then calculat the amount for eaach one
            finalResult = String(format: "%.2f", result) //return it to a string to show it on the final resault label in the resaultViewController
        }
        self.performSegue(withIdentifier: "goToResults", sender: self) //go to the segue with this identifier on the button click
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }
}
