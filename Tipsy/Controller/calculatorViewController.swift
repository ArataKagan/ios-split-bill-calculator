//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class calculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
   
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet var tipButtons: [UIButton]!
    
    var inputValue:Int? = 0
    var tip:Float? = 0.1
    
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
       
        let splitNumFloat = Float(splitNumberLabel.text!)!
      
        print(totalBill/splitNumFloat)
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
       
        // Pass the selected object to the new view controller.
    }
    
}

