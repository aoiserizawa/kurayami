//
//  ViewController.swift
//  kurayami
//
//  Created by alvin joseph valdez on 08/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: Intializer
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: View controller lifecycle methods    
    public override func loadView() {
        self.view = MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longpressed = UILongPressGestureRecognizer(target: self, action: #selector(longpressedAction(_:)))
        longpressed.minimumPressDuration = 0
        longpressed.numberOfTouchesRequired = 2
        self.rootView.addGestureRecognizer(longpressed)

        self.rootView.button.addTarget(
            self,
            action: #selector(shareAction(_:)),
            for: UIControlEvents.touchUpInside
        )

    }

    // MARK: Stored Properties
    private var circleView: ShapeView!

}

// MARK: - Views
extension MainVC {
    public unowned var rootView: MainView { return self.view as! MainView } // swiftlint:disable:this force_cast
}

// MARK: - Action Functions
extension MainVC {
    
    @objc func longpressedAction(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            self.addCircle(gesture: sender)
            
        } else if sender.state == .changed {
            
            let location = sender.location(in: self.view)
            self.circleView.center = CGPoint(
                x: view.center.x + (location.x - view.center.x),
                y: view.center.y + (location.y - view.center.y)
            )

        } else if sender.state == .ended{
            self.circleView.removeFromSuperview()
        }
    }
    
    @objc func pinchAction(_ sender: UIPinchGestureRecognizer){
        print("PINCHING")
        let scale = sender.scale
        
        print(scale)
        
        let scaleTransform: CGAffineTransform = self.circleView.transform.scaledBy(x: scale, y: scale)
        
        if scaleTransform.d < 1.2 {
            self.circleView.transform = scaleTransform
        }
        sender.scale = 1.0
        
        print(self.scaleOf(transform: scaleTransform))
        
        
        
    }

    @objc func shareAction(_ sender: UIButton) {
        let urlString = "https://www.google.com"

        let linkToShare = [urlString]

        let activityController = UIActivityViewController(activityItems: linkToShare, applicationActivities: nil)

        self.present(activityController, animated: true) {
            print("shared")
        }
    }
}

// MARK: - Helper Function
extension MainVC {
    
    func addCircle(gesture: UIGestureRecognizer) {
        
        let tapPoint = gesture.location(in: self.rootView)
        
        let pinchRecog: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinchAction(_:)))
        
        self.circleView = ShapeView(origin: tapPoint, pinchRecognizer: pinchRecog)
        self.circleView.pinchRecognizer.delegate = self
        self.rootView.addGestureRecognizer(pinchRecog)
        
        self.rootView.addSubview(self.circleView)
    }
    
    func scaleOf(transform: CGAffineTransform) -> CGPoint {
        let xScale = sqrt(transform.a * transform.a + transform.c * transform.c)
        let yScale = sqrt(transform.b * transform.b + transform.d * transform.d)
        
        return CGPoint(x: xScale, y: yScale)
    }

}

extension MainVC: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

