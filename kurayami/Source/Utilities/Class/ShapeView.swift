//
//  ShapeView.swift
//  kurayami
//
//  Created by alvin joseph valdez on 14/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

class ShapeView: UIView {
    let size: CGFloat = 150.0
    
    var circleLayer: CAShapeLayer!
    var circlePath: UIBezierPath!
    var roundRect: CGRect!
    var pinchRecognizer: UIPinchGestureRecognizer
    
    init(origin: CGPoint, pinchRecognizer: UIPinchGestureRecognizer) {
        
        self.roundRect = CGRect(x: 0.0, y: 0.0, width: self.size, height: self.size)        
        self.pinchRecognizer = pinchRecognizer
        super.init(frame: self.roundRect)
        self.center = origin
        
        self.circlePath = UIBezierPath(roundedRect: self.roundRect, cornerRadius: 10)
        
        self.circleLayer = CAShapeLayer()
        self.circleLayer.path = circlePath.cgPath
        self.circleLayer.fillColor = UIColor.clear.cgColor
        self.circleLayer.strokeColor = UIColor.red.cgColor
        self.circleLayer.lineWidth = 10.0
        self.circleLayer.strokeEnd = 1.0        
        
        // Add the circleLayer to the view's layer's sublayers
        layer.addSublayer(self.circleLayer)
        
//        self.initGestureRecognizers()
    }
    
    // We need to implement init(coder) to avoid compilation errors
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initGestureRecognizers() {
        let pinchGR = UIPinchGestureRecognizer(target: self, action: #selector(didPinch(pinchGR:)))
        addGestureRecognizer(pinchGR)
        
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(didPan(panGR:)))
        addGestureRecognizer(panGR)
    }
    
    @objc func didPinch(pinchGR: UIPinchGestureRecognizer) {
        print("hahahah")
        self.superview!.bringSubview(toFront: self)
        
        let scale = pinchGR.scale
        
        self.transform = self.transform.scaledBy(x: scale, y: scale)
        
        pinchGR.scale = 1.0
    }
    
    @objc func didPan(panGR: UIPanGestureRecognizer) {
        
        self.superview!.bringSubview(toFront: self)
        
        var translation = panGR.translation(in: self)
        
        self.center.x += translation.x
        self.center.y += translation.y
        
        panGR.setTranslation(CGPoint.zero, in: self)
    }

}
