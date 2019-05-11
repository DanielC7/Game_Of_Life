//
//  ViewController.swift
//  gameOfLife
//
//  Created by Daniel Cohen on 8/27/15.
//  Copyright (c) 2015 Daniel Cohen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var wow = 5;
    
    var germs= [2,2,2,2,2,2,2,2,2,2,2,1,1,0,1,0,1,1,1,2,2,0,1,1,1,1,1,0,1,2,2,1,1,0,1,1,1,0,1,2,2,0,1,1,0,1,1,0,1,2,2,1,1,0,1,1,1,0,1,2,2,0,1,1,0,1,0,0,1,2,2,1,1,0,1,1,1,0,1,2,2,1,0,1,0,1,0,0,1,2,2,1,1,0,1,1,1,0,1,2,2,0,1,1,0,1,1,0,1,2,2,1,1,0,1,0,1,1,0,2,2,1,1,1,0,1,1,0,1,2,2,1,0,1,1,0,1,1,1,2,2,0,1,1,0,1,1,0,1,2,2,1,0,1,1,1,1,0,1,2,2,1,0,1,0,1,1,0,1,2,2,1,0,0,1,0,1,0,1,2,2,0,0,1,0,1,1,0,1,2,2,1,1,0,1,1,1,0,0,2,2,0,0,1,1,0,1,0,1,2,2,1,1,0,1,1,1,0,1,2,2,0,1,1,0,0,1,1,1,2,2,1,1,0,1,0,1,1,0,2,2,1,1,1,0,1,0,1,1,2,2,1,1,0,1,1,1,0,1,2,2,1,1,0,1,1,1,0,1,2,2,1,0,1,1,1,0,0,1,2,2,0,1,0,1,1,0,1,0,2,2,2,2,2,2,2,2,2,2,2]
    
    var newGerms = [Int]()
    var index = 0
    var newGermStringArray = ""
    var liveCount = 0
    var timer = Timer()
    
    
    @IBOutlet weak var textField: UITextView!
    
    
    @IBAction func action(_ sender: AnyObject) {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.realLife), userInfo: nil, repeats: true)
    }
    
    func realLife(){
        for x in self.germs{
            newGerms.append(x)
            if x != 2{
                if germs[index-11] == 1 {liveCount += 1}
                if germs[index-10] == 1 {liveCount += 1}
                if germs[index-9] == 1 {liveCount += 1}
                if germs[index-1] == 1 {liveCount += 1}
                if germs[index+1] == 1 {liveCount += 1}
                if germs[index+9] == 1 {liveCount += 1}
                if germs[index+10] == 1 {liveCount += 1}
                if germs[index+11] == 1 {liveCount += 1}
                
                if liveCount < 2 || liveCount > 3 {
                    newGerms[index] = 0
                }
                if liveCount == 3 {
                    newGerms[index] = 1
                }
            }
            index += 1
            liveCount = 0
            //    println(newGerms)
        }
        germs = newGerms
        newGerms = [Int]()
        index = 0
        var aString = ""
        
        for var i = 0; i <= germs.count-1; i += 10 {
            for j in i ..< i+10 {
                if germs[j] == 2{
                    aString += " \t"
                }
                if germs[j] == 1{
                    aString += "👽\t"
                }
                if germs[j] == 0{
                    aString += " \t"
                }
            }
            aString += "\n\n"
        }
        textField.text = aString
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

