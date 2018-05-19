//
//  Coordinator.swift
//  kurayami
//
//  Created by alvin joseph valdez on 08/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import Foundation

public protocol Coordinator: class {
    
    /**
     The child Coordinators being managed by this Coordinator
     */
    var childCoordinators: [Coordinator] { get }
    
    /**
     Add child coordinator to childCoordinators array
     - parameter coordinator: Coordinator to add.
     */
    func add(childCoordinator coordinator: Coordinator)
    
    /**
     Remove child coordinator to childCoordinators array
     - parameter coordinator: Coordinator to remove.
     */
    func remove(childCoordinator coordinator: Coordinator)
    
    /**
     The start method is where the Coordinator executes its setup logic to manage its UIViewController.
     This should only be called once in the entire lifetime of the Coordinator instance.
     Calling this more than once results in a forced fatalError.
     Must call super.
     */
    func start()
}
