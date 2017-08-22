//
//  ViewController.swift
//  ChangeColor
//
//  Created by ebrahim hassan on 7/12/17.
//  Copyright © 2017 ebrahim hassan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ViewColor: UIView!
    @IBOutlet weak var RSwitch: UISwitch!
    @IBOutlet weak var GSwitch: UISwitch!
    @IBOutlet weak var BSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func RedSWitch(_ sender: Any) {
        ViewColor.backgroundColor=UIColor.red;
        GSwitch.setOn(false, animated: true)
        BSwitch.setOn(false, animated: true)
    }
    
    @IBAction func GreenSwitch(_ sender: Any) {
        ViewColor.backgroundColor=UIColor.green;
        RSwitch.setOn(false,animated: true)
        BSwitch.setOn(false, animated: true)
    }
    @IBAction func BlueSwitch(_ sender: Any) {
        ViewColor.backgroundColor=UIColor.blue;
        RSwitch.setOn(false, animated: true)
        GSwitch.setOn(false, animated: true)


    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

