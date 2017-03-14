//
//  SettingsTableViewController.swift
//  tippin
//
//  Created by Sabareesh Kappagantu on 3/4/17.
//  Copyright © 2017 Sabareesh Kappagantu. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController  {

    @IBOutlet weak var defaultTipLabel: UILabel!
    @IBOutlet weak var splitByLabel: UILabel!
    let step: Float = 1
    let dfltTip = [10, 15, 18, 20]
    var globalTip = 0
    let preferences = UserDefaults.standard
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var splitSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(_ animated: Bool){
        if let y = preferences.object(forKey: "defaultTip") as? Int {
            defaultTipLabel.text = String(dfltTip[y])
            globalTip = y
            tipSlider.value = Float(y)
        }
        if let x = preferences.object(forKey: "defaultSplit") as? String {
            splitByLabel.text = x
            splitSlider.value = Float(x)!
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    @IBAction func increaseDefaultTip(_ sender: UISlider) {
        let roundedValue = round(sender.value/step) * step
        sender.value = roundedValue
        globalTip = Int(roundedValue)
        defaultTipLabel.text = String(dfltTip[Int(sender.value)])
    }

    @IBAction func increaseSplitBy(_ sender: UISlider) {
        splitByLabel.text = String(Int(sender.value))
    }
    
    @IBAction func saveSettings(_ sender: UIButton) {
        
        //Change color of button on save
        sender.backgroundColor = UIColor.green
        //let tipIndex = dfltTip.index(of: Int(defaultTipLabel.text!)!) ?? 0
        preferences.setValue(globalTip, forKey: "defaultTip")
        preferences.setValue(splitByLabel.text, forKey: "defaultSplit")
        if let x = preferences.object(forKey: "defaultTip") as? String {
            defaultTipLabel.text = x
        }
        if let y = preferences.object(forKey: "defaultSplit") as? String {
            splitByLabel.text = y
        }
        //To automatically switch back to the previous view after save
        _ = navigationController?.popViewController(animated: true)
    }
}
