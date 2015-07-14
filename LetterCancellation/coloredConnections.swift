//
//  coloredConnections.swift
//  LetterCancellation
//
//  Created by School on 7/13/15.
//  Copyright (c) 2015 sunspot. All rights reserved.
//

import Foundation

import UIKit

class coloredConnections: UIView {
    
    private var colorPath = UIBezierPath()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        println("Initializing")
    }
    
    
    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        backgroundColor = UIColor.clearColor()
        colorPath.lineWidth = 5
        colorPath.lineCapStyle = kCGLineCapRound
    }
    
    override func drawRect(rect: CGRect) {
        //println("in drawRect")
        UIColor.blackColor().set()
        opaque = false
        backgroundColor = nil
        colorPath.stroke()
        
    }
    
    func reset() {
        println("In reset")
        colorPath.removeAllPoints()
        setNeedsDisplay()
    }
    
}