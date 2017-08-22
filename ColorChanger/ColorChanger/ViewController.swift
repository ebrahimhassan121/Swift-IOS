//
//  ViewController.swift
//  ColorChanger
//
//  Created by ebrahim hassan on 7/15/17.
//  Copyright © 2017 ebrahim hassan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ViewColor: UIView!
    @IBOutlet weak var RedSlider: UISlider!
    @IBOutlet weak var GreenSlider: UISlider!
    @IBOutlet weak var BlueSlider: UISlider!
    @IBOutlet weak var HexLabel:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ChangeColor(_ sender : AnyObject){
        let r:Float = RedSlider.value;
        let g:Float = GreenSlider.value;
        let b:Float = BlueSlider.value;
        let color = UIColor(red: CGFloat(r) , green: CGFloat(g), blue: CGFloat(b), alpha: 1)
        ViewColor.backgroundColor = color
        let hex = color.toHexString
        HexLabel.text="#"+hex
        
    }


}
extension UIColor {
    var toHexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return String(
            format: "%02X%02X%02X",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }
}

