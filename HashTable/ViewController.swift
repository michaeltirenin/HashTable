//
//  ViewController.swift
//  HashTable
//
//  Created by Michael Tirenin on 9/2/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var hashTable = HashTable(size: 300)
        
        var redBox = UIView()
        hashTable.setObject(redBox, key: "Brad")
        
        var blueBox = UIView()
        hashTable.setObject(redBox, key: "Mike")
        
        var VC = UIViewController()
        hashTable.setObject(VC, key: "Leo")
        
        var blackBox = UIView()
        hashTable.setObject(blackBox, key: "number0")
        
        var blackBox1 = UIView()
        hashTable.setObject(blackBox1, key: "number1")
        
        var VC2 = UIViewController()
        hashTable.setObject(VC2, key: "VC2")
        
        var blackBox2 = UIView()
        hashTable.setObject(blackBox2, key: "number2")
        
        for var i = 0; i < hashTable.size; i++ {
            var name = UIView()
            hashTable.setObject(UIView(), key: "number" + "\(i)")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

