//
//  ViewController.swift
//  Groceory
//
//  Created by ebrahim hassan on 8/18/17.
//  Copyright © 2017 ebrahim hassan. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    let coreDataContainer = AppDelegate.persistentContainer
    let container = AppDelegate.viewContext
    override func viewDidLoad() {
        let tweet=Tweet(context:container)
        tweet.created=Date() as NSDate
        tweet.text="KOSOM IOS"
        let eh=TweetUser(context: tweet.managedObjectContext!)
        eh.addToTweets(tweet)
        tweet.tweeter?.name="eh"
        do{
            try container.save()
        }catch{
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

