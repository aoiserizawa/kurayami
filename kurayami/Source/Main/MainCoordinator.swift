//
//  MainCoordinator.swift
//  kurayami
//
//  Created by alvin joseph valdez on 08/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import Foundation
import UIKit

public final class MainCoordinator: AbstractCoordinator {
    
    // MARK: Delegate Properties
//    private unowned let delegate: MainCoordinatorDelegate
    
    // MARK: Initializers
    public init(navigationController: UINavigationController) {
//        self.delegate = delegate
        self.navigationController = navigationController
        super.init()
    }
    
    // MARK: Stored Properties
    private let navigationController: UINavigationController
    
    // MARK: Instance Methods
    public override func start() {
        super.start()
        let vc: MainVC = MainVC()
        self.navigationController.pushViewController(
            vc,
            animated: true
        )
    }

    
}
