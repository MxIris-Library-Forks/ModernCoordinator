//
//  Coordinator.swift
//  Presentation
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
/// `Coordinating` is the protocol every coordinator conforms to.
///
/// It requires an object to be able to add, remove its child and can be removed themselves from parent like `removeFromSuperview`.
///

public protocol Coordinating: Presentable {
    func addChild(_ coordinator: Coordinating)
    func removeChild(_ coordinator: Coordinating)
    func removeAllChild<T>(with type: T.Type)
    func removeAllChild()
    func removeFromParent()
    func registerParent(_ coordinator: Coordinating)
    var parent: Coordinating? { get }
}
