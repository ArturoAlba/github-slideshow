//
//  tempoViewController.swift
//  HEMA - Meyer Square
//
//  Created by Arturo Alba on 11/05/20.
//  Copyright © 2020 Ritterschaft HEMA. All rights reserved.
//

import UIKit

class tempoViewController: UIViewController {
    
    //BASICS

    let myZornhaw = "ZORNHAW"
    let myUnterhaw = "UNTERHAW"

    let myRight = "RIGHT"
    let myLeft = "LEFT"

    lazy var myLeftZornhaw = myLeft + " " + myZornhaw
    lazy var myRightZornhaw = myRight + " " + myZornhaw
    lazy var myLeftUnterhaw = myLeft + " " + myUnterhaw
    lazy var myRightUnterhaw = myRight + " " + myUnterhaw

    
    //BUTTONS
    
    @IBOutlet weak var myTechnique: UILabel!
    
    @objc var myTechniqueShow = "Tehnique"
    
    @IBOutlet weak var upLeftArrow: UIImageView!
    @IBOutlet weak var upRightArrow: UIImageView!
    @IBOutlet weak var downLeftArrow: UIImageView!
    @IBOutlet weak var downRightArrow: UIImageView!
    
    
    //TIMER
    
    var startInt = 10
    var startTimer = Timer ()
    
    var fenceInt = 30
    var fenceTimer = Timer ()
    
    var myTechniqueTimer: Timer?
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var myStart: UIButton!
    
    
    //INICIO
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTechniqueShow = randomText()
        
        myTechnique.text = String (myTechniqueShow)
        
        upLeftArrow.alpha = 0
        upRightArrow.alpha = 0
        downLeftArrow.alpha = 0
        downRightArrow.alpha = 0
        
        startInt = 10
        myStart.setTitle(String(startInt), for: .normal)
        myStart.isEnabled = false
        
        fenceInt = 30
        timeLabel.text = String(fenceInt)
        
        startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tempoViewController.startTrainingTimer), userInfo: nil, repeats: true)
        
        myTechniqueTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(randomText), userInfo: nil, repeats: true)
        
        }
        
  
    
    @objc func startTrainingTimer() {
        startInt -= 1
        myStart.setTitle(String(startInt), for: .normal)
        
        if startInt == 0 {
            
            startTimer.invalidate()
            
            myStart.setTitle ("FENCE", for: .normal)
            myStart.isEnabled = true
            
            fenceTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tempoViewController.game), userInfo: nil, repeats: true)
            
        }
    }
    
    @objc func game () {
        
        fenceInt -= 1
        timeLabel.text = String(fenceInt)
        
        if fenceInt == 0 {
            
            fenceTimer.invalidate()
            myStart.isEnabled = false
        }
    }
    
    @objc func randomText() -> String {
        let words = ["LEFT ZORNHAW", "RIGHT ZORNHAW", "LEFT UNTERHAW", "RIGHT UNTERHAW"]
        return words[Int(arc4random_uniform(UInt32(words.count)))]
        
    }
    
  
      


    
}
