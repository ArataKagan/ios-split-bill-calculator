//
//  resultsViewController.swift
//  Tipsy
//
//  Created by Arata Kagan on 11/29/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var resultsTotal:Float?
    var tipAmount:Float?
    var partyNum:Float? 

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(resultsTotal!)
        settingLabel.text = "Split between \(Int(partyNum!)) people, with \(tipAmount!) tip."
    }
    
    @IBAction func recalculatedPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
