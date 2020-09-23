//
//  FourthViewController.swift
//  UIKitStudy
//
//  Created by yury antony on 11/08/20.
//  Copyright © 2020 yuryAntony. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var viewCobaia: UIView!
    @IBOutlet weak var labelCobaia: UILabel!
    
    var recognizer = UITapGestureRecognizer(target: self, action: #selector(gestureFired(_:)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recognizer = UITapGestureRecognizer(target: self, action: #selector(gestureFired(_:)))
        
        viewCobaia.backgroundColor = .brown
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        
        viewCobaia.addGestureRecognizer(recognizer)
    }
    @IBAction func whenChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            viewCobaia.backgroundColor = .brown
            recognizer.numberOfTapsRequired = 1
        case 1:
            viewCobaia.backgroundColor = .black
            recognizer.numberOfTapsRequired = 2
        case 2:
            viewCobaia.backgroundColor = .blue
            recognizer.numberOfTapsRequired = 3
        case 3:
            viewCobaia.backgroundColor = .red
            recognizer.numberOfTapsRequired = 4
        default:
            break
        }
    }
    

    @objc func gestureFired(_ gesture: UITapGestureRecognizer){
        view.backgroundColor = viewCobaia.backgroundColor

    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if labelCobaia.text == "Segment and Touches"{
            labelCobaia.text = "Touches and Segment"
        }else{
            labelCobaia.text = "Segment and Touches"
        }
        
    }
}


