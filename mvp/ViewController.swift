//
//  ViewController.swift
//  mvp
//
//  Created by User on 25/05/2016.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var counter: Int = 15
    
    @IBOutlet var circularProgressView: KDCircularProgress!
    
    @IBOutlet var timerLabel: UILabel!
    
    @IBOutlet var hintLabel: UILabel!
    
    @IBOutlet var progressLabel: UILabel!
    
    @IBAction func playButton(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateCounter", userInfo: nil, repeats: true)
        print(timer)
        progressLabel.text = "Just Focus!"
    }
    
    @IBAction func stopButton(sender: AnyObject) {
        timer.invalidate()
        counter = 15
        progressLabel.text = "Do not distract!"
        
        // Returns animated angry gif
        let imageGif = UIImage.gifWithName("angry")
        let imageView = UIImageView(image: imageGif)
        imageView.frame = CGRectMake(0, 80, 400, 220)
        view.addSubview(imageView)
    }
    
    func updateCounter() {
        timerLabel.text = String(counter--)
        
        // Circular Progress
        var currentCount = 0.0
        let maxCount = 15.0
        
        if currentCount != maxCount {
            currentCount += 1.0
            circularProgressView.animateToAngle(0.0, duration: 1.0, completion: nil)
        }
        
        circularProgressView.animateFromAngle(circularProgressView.angle, toAngle: 360.0, duration: 1.0, completion: nil)
        
        if counter == -1 {
            timer.invalidate()
            progressLabel.text = "Badass!"
            timer.invalidate()
            counter = 15
            timerLabel.text = String(counter)
            
            // Returns animated badass gif
            let imageGif = UIImage.gifWithName("badass")
            let imageView = UIImageView(image: imageGif)
            imageView.frame = CGRectMake(0, 80, 400, 220)
            view.addSubview(imageView)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        circularProgressView.angle = 0.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

