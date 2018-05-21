//
//  MainView.swift
//  kurayami
//
//  Created by alvin joseph valdez on 08/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit
import Kio

public final class MainView: HeroView {

    // MARK: Subviews
    public let button: UIButton = {
        let view: UIButton = UIButton(type: UIButtonType.custom)
        view.setTitle("Share", for: UIControlState.normal)
        view.setTitleColor(UIColor.blue, for: UIControlState.normal)
        return view
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.black

        self.rpd.subviews(forAutoLayout: [self.button])

        self.button.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.center.equalToSuperview()
        }

    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

