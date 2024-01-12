//
//  Presentable.swift
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
/// Presentable is representing for the object that can be shown to the user.
///

public protocol Presentable {
    var viewController: ViewController { get }
}

extension ViewController: Presentable {
    public var viewController: ViewController {
        return self
    }
}
