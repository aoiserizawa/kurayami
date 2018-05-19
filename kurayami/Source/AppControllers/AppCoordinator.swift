//
//  AppCoordinator.swift
//  kurayami
//
//  Created by alvin joseph valdez on 08/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import Foundation
import UIKit

open class AppCoordinator: AbstractCoordinator {
    
    // MARK: Initializer
    public init(window: UIWindow, rootViewController: UINavigationController) {
        self.window = window
        self.rootViewController = rootViewController
        super.init()
        
        self.window.backgroundColor = UIColor.black
        self.window.rootViewController = self.rootViewController
        self.window.makeKeyAndVisible()
    }
    
    // MARK: Stored Properties
    private unowned let window: UIWindow
    private unowned let rootViewController: UINavigationController
    
    open override func start() {
        let mainCoordinator: MainCoordinator = MainCoordinator(
            navigationController: self.rootViewController
        )
        mainCoordinator.start()
        self.add(childCoordinator: mainCoordinator)
    }
}
