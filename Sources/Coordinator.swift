//
//  BaseCoordinator.swift
//  ModernCoordinator
//
//  Created by DucPD on 08/11/2021.
//

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#endif

#if canImport(UIKit)
import UIKit
#endif

///
/// `Coordinator` can be used as a superclass for any custom implementation of a coordinator.
///
open class Coordinator<RouteType: Route, TransitionType: RootTransition>: Coordinating {
    public typealias RootViewController = TransitionType.RootViewController
    public var rootViewController: RootViewController
    public var parent: Coordinating?
    public var children: [Coordinating] = []
    
    public var transitionPerformer: Transition<RootViewController> {
        return Transition(rootViewController: rootViewController)
    }
    
    public init(rootViewController: RootViewController, initialRoute: [RouteType]) {
        self.rootViewController = rootViewController
        _ = initialRoute.map(performTransition)
    }
    
    open func performTransition(for route: RouteType) {
        fatalError("Please override the \(#function) method.")
    }
    
    public func removeFromParent() {
        parent?.removeChild(self)
    }

    public func addChild(_ coordinator: Coordinating) {
        children.append(coordinator)
        coordinator.registerParent(self)
    }
    
    public func registerParent(_ coordinator: Coordinating) {
        parent = coordinator
    }

    public func removeChild(_ coordinator: Coordinating) {
        if let index = children.firstIndex(where: { $0.viewController === coordinator.viewController }) {
            let child = children[index]
            child.removeAllChild()
            children.remove(at: index)
        } else {
            print("Couldn't remove coordinator: \(coordinator). It's not a child coordinator.")
        }
    }
    
    public func removeAllChild<T>(with type: T.Type) {
        children.removeAll(where: { $0 is T })
    }

    public func removeAllChild() {
        children.forEach { $0.removeAllChild() }
        children.removeAll()
    }
    
    public var viewController: ViewController {
        return rootViewController
    }
            
    deinit {
        debugPrint("Deinit 📣: \(String(describing: self))")
    }
}

extension Coordinator: Router {
    public typealias RouteType = RouteType
    
    public func trigger(_ route: RouteType) {
        performTransition(for: route)
    }
    
    public var strongRouter: StrongRouter<RouteType> {
        return StrongRouter(self)
    }
    
    public var unownedRouter: UnownedRouter<RouteType> {
        return UnownedRouter(self) { $0.strongRouter }
    }
}
