//
//  ViewController.swift
//  ImagePicker
//
//  Created by ebrahim hassan on 7/15/17.
//  Copyright © 2017 ebrahim hassan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ShowButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func experiment(_ sender: Any) {
        let image = UIImage()
        let controller=UIActivityViewController(activityItems: [image], applicationActivities: nil)
        let controller2=UIAlertController()
        controller2.title="alert title test"
        controller2.message="hellow alert controller"
        let okAlertAction=UIAlertAction(title: "DISMISS", style: UIAlertActionStyle.default, handler:{(action:UIAlertAction)in self.comp(action: action)})
        controller2.addAction(okAlertAction)
        let NextController=UIImagePickerController()
        self.present(controller2, animated: true, completion:nil)
        //action dismiss(animated: true, completion: nil)
        
    }
    func comp(action : UIAlertAction) -> Void {
      
        dismiss(animated: true, completion: nil)
       print("Complete\(  action.title) ")
    }


}

