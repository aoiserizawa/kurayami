//
//  MainView.swift
//  kurayami
//
//  Created by alvin joseph valdez on 08/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import UIKit

public final class MainView: HeroView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

