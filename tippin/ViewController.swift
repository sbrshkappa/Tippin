//
//  ViewController.swift
//  tippin
//
//  Created by Sabareesh Kappagantu on 3/1/17.
//  Copyright © 2017 Sabareesh Kappagantu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billValue: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Setting the cursor to show up by default in the Bill Value Field
        billValue.becomeFirstResponder()
        billValue.placeholder = "0.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.10, 0.15, 0.18, 0.20]
        
        //Change the bill value to number else set default to 0
        let bill = Double(billValue.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let splitValue = Double(splitLabel.text!) ?? 0
        let splitAmount = total / splitValue
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitAmountLabel.text = String(format: "$%.2f", splitAmount)
    }
    
    
    @IBAction func incrementSplit(_ sender: UIStepper) {
        splitLabel.text = "\(Int(sender.value))"
    }
}

