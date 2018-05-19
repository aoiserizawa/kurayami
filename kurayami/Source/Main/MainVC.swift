//
//  ViewController.swift
//  kurayami
//
//  Created by alvin joseph valdez on 08/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UIGestureRecognizerDelegate {
    
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
        
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapAction(_:)))
//        tap.numberOfTouchesRequired = 2
//        self.rootView.addGestureRecognizer(tap)
        
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
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if gestureRecognizer == self.circleView.pinchRecognizer {
            return true
        } else {
            return false
        }
    }
    
    @objc func pinchAction(_ sender: UIPinchGestureRecognizer){
        print("PINCHING")
        let scale = sender.scale
        self.circleView.transform = self.circleView.transform.scaledBy(x: scale, y: scale)
        sender.scale = 1.0
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
}
