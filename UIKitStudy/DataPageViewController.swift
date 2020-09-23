//
//  DataPageViewController.swift
//  UIKitStudy
//
//  Created by yury antony on 11/08/20.
//  Copyright © 2020 yuryAntony. All rights reserved.
//

import UIKit

class DataPageViewController: UIViewController {

    @IBOutlet weak var labelContent: UILabel!
    var displayText: String?
    var index: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        labelContent.text = displayText

        // Do any additional setup after loading the view.
    }
    


}
