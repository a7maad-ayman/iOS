
import UIKit

class CalculaViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain( )
    
    @IBOutlet weak var hightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var hightSliderLabel: UISlider!
    @IBOutlet weak var weightSliderLabel: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func hightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        hightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    @IBAction func claculatePressed(_ sender: UIButton) {
        let height = hightSliderLabel.value
        let weight = weightSliderLabel.value
        calculatorBrain.calculatBMI(height: height, weight: weight)
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

