//
//  ViewController.swift
//  LetterCancellation
//
//  Created by School on 6/25/15.
//  Copyright (c) 2015 sunspot. All rights reserved.
//

var resultTextLetters = ""
var font = 20

import UIKit

class ViewController: UIViewController {

    var drawingView: SwiftDrawView!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var fontLabel: UILabel!
    
    @IBAction func sizeChanged(sender: UISlider) {
        
        var currentValue = Int(sender.value)
        
        font = currentValue
        fontLabel.text = "Adjust font size: \(currentValue)"
        
    }
    
    @IBAction func StartButton(sender: AnyObject) {
        
        println("start button clicked")
        
        resultLabel.text = ""
        
        if drawingView !== nil {
            drawingView.removeFromSuperview()
        }
        
        let drawViewFrame = CGRect(x: 0.0, y: 120.0, width: view.bounds.width, height: view.bounds.height-120.0)
        drawingView = SwiftDrawView(frame: drawViewFrame)
        
        println("\(view.bounds.width) \(view.bounds.height)")
        
        view.addSubview(drawingView)
        
        drawingView.reset()
        
    }
    
    @IBAction func StopButton(sender: AnyObject) {
        
        letters.checkResultListLetters()
        resultLabel.text = resultTextLetters
        
        let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        DateLabel.text = timestamp
        
        screenShotMethod()
        
        resultTextLetters = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Landscape.rawValue)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func screenShotMethod() {
        let layer = UIApplication.sharedApplication().keyWindow!.layer
        let scale = UIScreen.mainScreen().scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        
        layer.renderInContext(UIGraphicsGetCurrentContext())
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(screenshot, nil, nil, nil)
    }



}

