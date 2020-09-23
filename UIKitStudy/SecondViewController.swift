//
//  SecondViewController.swift
//  UIKitStudy
//
//  Created by yury antony on 09/08/20.
//  Copyright © 2020 yuryAntony. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var numberText: UILabel!
    @IBOutlet weak var numberText2: UILabel!
    @IBOutlet weak var switchIObj: UISwitch!
    @IBOutlet weak var stepperObj: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn{
            numberText2.text = String(stepperObj.value)
        }
    }
    @IBAction func stepperAction(_ sender: UIStepper) {
        numberText.text = String(sender.value)
    }
    
}
