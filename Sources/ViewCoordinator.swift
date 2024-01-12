//
//  ViewCoordinator.swift
//  ModernCoordinator
//
//  Created by DucPD on 11/11/2021.
//

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#endif

#if canImport(UIKit)
import UIKit
#endif

///
/// `ViewCoordinator` is a base class for custom coordinators with a `UIViewController` as `rootViewController`.
///
open class ViewCoordinator<RouteType: Route>: Coordinator<RouteType, ViewTransition> {
    public init(rootViewController: RootViewController, initialRoute: RouteType...) {
        super.init(rootViewController: rootViewController, initialRoute: initialRoute)
    }
}
