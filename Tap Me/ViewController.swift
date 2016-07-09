//
//  ViewController.swift
//  Tap Me
//
//  Created by C K Campagne on 09/07/2016.
//  Copyright © 2016 CKC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var score: Int!
    var seconds = 0
    var timer = NSTimer()
    
    
    @IBOutlet var scoreLabel : UILabel!
    @IBOutlet var timeLabel : UILabel!
    
    
    @IBAction func buttonPressed(){
        
        print("Button pressed")
        score = score + 1
        scoreLabel.text = ("Score: \(score)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGame()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupGame(){
        score = 0
        seconds = 30
        scoreLabel.text = "Score: \(score)"
        timeLabel.text = "Time: \(seconds)"
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.subTime), userInfo: nil, repeats: true)
    }
    
    func subTime(){
        
        seconds  -= 1
        timeLabel.text = "Time: \(seconds)"
        if seconds == 0 {
            
            timer.invalidate()
            
            let anAlert = UIAlertController(title: "Time Up!",
                                            message: "You scored: \(score)",
                                            preferredStyle: UIAlertControllerStyle.Alert)
            
            anAlert.addAction(UIAlertAction(title: "Play Again.",
                style: UIAlertActionStyle.Default,
                handler: {action in self.setupGame()}))
        self.presentViewController(anAlert, animated: true, completion: nil)
        
        }
    }
}

