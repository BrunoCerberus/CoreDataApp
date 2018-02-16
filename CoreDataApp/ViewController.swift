//
//  ViewController.swift
//  CoreDataApp
//
//  Created by Bruno Lopes de Mello on 15/02/18.
//  Copyright © 2018 Bruno Lopes de Mello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var user: [User]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Clean delete before every run
        CoreDataHandler.cleanDelete()
        
        CoreDataHandler.saveObject(username: "Bruno", password: "123456")
        CoreDataHandler.saveObject(username: "Carol", password: "654321")
        CoreDataHandler.saveObject(username: "Alexandre", password: "Masturboy")
        user = CoreDataHandler.fetchObject()
        print("Before Delete")
        for i in user! {
            print(i.username!)
        }
        
//        if CoreDataHandler.deleteObject(user: user![1]) {
//
//            user = CoreDataHandler.fetchObject()
//            print("After delete")
//            for i in user! {
//                print(i.username!)
//            }
//        }
        
        user = CoreDataHandler.filterData()
        print("Fetching users with predicate")
        for i in user! {
            print(i.username!)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

