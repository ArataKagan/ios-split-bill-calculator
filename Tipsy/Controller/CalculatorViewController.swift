//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
   
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet var tipButtons: [UIButton]!
    
    var inputValue:Int? = 0
    var tip:Float? = 0.1
    var splitTotal:Float?
    var partyNum: Float?
    
    
    @IBAction func billValueChanged(_ sender: UITextField) {
        billTextField.endEditing(true)
        billTextField.text = sender.text!
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
       
        tipButtons.forEach { $0.isSelected = false
            $0.setTitleColor(#colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1), for: .normal)
        }
        
        sender.isSelected = true
        tip = Float(sender.currentTitle!.dropLast())
        print(tip!/100)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
    
        let baseBill = Float(billTextField.text!)!
        let tipAmount = baseBill * tip!
        let totalBill = baseBill + tipAmount
       
        partyNum = Float(splitNumberLabel.text!)!
        
        splitTotal = (totalBill/partyNum!)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.resultsTotal = splitTotal
            destinationVC.tipAmount = tip
            destinationVC.partyNum = partyNum
        }
        // Pass the selected object to the new view controller.
    }
    
}

