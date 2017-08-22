//
//  ViewController.swift
//  ZooAPP
//
//  Created by ebrahim hassan on 8/22/17.
//  Copyright © 2017 ebrahim hassan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var NotKiller=["Monkey","Donkey","Elephent","Deer","Cow"]
    var Killer=["Lion","Fox","Bear","Tigger","Shark"]
    var Section=["Killer","NotKiller"]
    @IBOutlet weak var TableViewList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NotKiller.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath )
        if(indexPath.section==0){
            cell.textLabel?.text=Killer[indexPath.row]
            
        }else{
            cell.textLabel?.text=NotKiller[indexPath.row]
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(NotKiller[indexPath.row])
//        NotKiller.append("New Item")
//        TableViewList.reloadData()
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Section[section]
    }
    
    

}

