//
//  ViewController2.swift
//  ZooAPP
//
//  Created by ebrahim hassan on 8/22/17.
//  Copyright © 2017 ebrahim hassan. All rights reserved.
//

import UIKit
class ViewController2: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var Animals=Array<Animal>()
    
    @IBOutlet weak var TableViewList:UITableView!
    override func viewDidLoad() {
     
        super.viewDidLoad()
        Animals.append(Animal(Name: "baboon", Des: "haza Hywan ", Image: "baboon"))
        Animals.append(Animal(Name: "bulldog", Des: "haza Hywan ", Image: "bulldog"))
        Animals.append(Animal(Name: "panda", Des: "haza Hywan ", Image: "panda"))
        Animals.append(Animal(Name: "swallow_bird", Des: "haza Hywan ", Image: "swallow_bird"))
        Animals.append(Animal(Name: "white_tiger", Des: "haza Hywan ", Image: "white_tiger"))
        Animals.append(Animal(Name: "zebra", Des: "haza Hywan ", Image: "zebra"))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Animals.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:mycell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! mycell
        cell.LaName.text=Animals[indexPath.row].Name
        cell.LaDes.text=Animals[indexPath.row].Des
        cell.LaImage.image=UIImage(named: Animals[indexPath.row].Image!)
        return cell

    }
}
