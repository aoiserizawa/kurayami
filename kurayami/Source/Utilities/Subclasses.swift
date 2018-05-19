//
//  Subclasses.swift
//  kurayami
//
//  Created by alvin joseph valdez on 08/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import Foundation
import UIKit

open class HeroObject: NSObject {
    deinit {
        print("\(self) was deallocated")
    }
}


open class HeroView: UIView {
    deinit {
        print("\(type(of: self)) was deallocated")
    }
}
