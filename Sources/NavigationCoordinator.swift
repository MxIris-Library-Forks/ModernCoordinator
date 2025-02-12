//
//  NavigationCoordinator.swift
//  ModernCoordinator
//
//  Created by DucPD on 10/11/2021.
//

#if canImport(UIKit)

import UIKit

///
/// NavigationCoordinator is a base class for custom coordinators with a `UINavigationController` rootViewController.
///
open class NavigationCoordinator<RouteType: Route>: Coordinator<RouteType, NavigationTransition> {
    public init(rootViewController: RootViewController = RootViewController(), isNavigationBarHidden: Bool = false, initialRoute: RouteType...) {
        super.init(rootViewController: rootViewController, initialRoute: initialRoute)
        rootViewController.isNavigationBarHidden = isNavigationBarHidden
    }
}


#endif


