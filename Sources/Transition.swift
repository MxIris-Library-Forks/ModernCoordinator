//
//  Transition.swift
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
/// `RootTransition` is used to abstract any concrete transition implementation.
///
/// `Transition` is provided as an easily-extensible default transition type implementation.
///

public protocol RootTransition {
    associatedtype RootViewController: ViewController
    var rootViewController: RootViewController { get set }
}
