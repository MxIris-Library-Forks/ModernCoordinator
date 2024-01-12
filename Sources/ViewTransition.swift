//
//  ViewTransition.swift
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

// `ViewTransition` offers transitions that can be used
// with a `UIViewController` as `rootViewController`.

public typealias ViewTransition = Transition<ViewController>

public struct Transition<RootViewController: ViewController>: RootTransition {
    public var rootViewController: RootViewController
    public init(rootViewController: RootViewController) {
        self.rootViewController = rootViewController
    }
}

#if canImport(UIKit)

extension Transition where RootViewController: UIViewController {
    public func present(
        _ presentable: Presentable,
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        let viewController = presentable.viewController
        guard viewController != rootViewController else {
            return
        }
        rootViewController.present(viewController, animated: animated, completion: completion)
    }

    public func present(
        _ presentable: Presentable,
        animated: Bool = true,
        modalPresentationStyle: UIModalPresentationStyle,
        completion: (() -> Void)? = nil
    ) {
        let viewController = presentable.viewController
        guard viewController != rootViewController else {
            return
        }
        viewController.modalPresentationStyle = modalPresentationStyle
        present(viewController, animated: animated, completion: completion)
    }

    public func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        rootViewController.dismiss(animated: animated, completion: completion)
    }
}

#endif

#if canImport(AppKit) && !targetEnvironment(macCatalyst)

extension Transition where RootViewController: NSViewController {
    /// How to present this view controller
    public enum PresentationMode {
        case asModalWindow(destination: NSViewController)
        case asSheet(destination: NSViewController)
        case asPopover(destination: NSViewController, relativeToRect: NSRect, ofView: NSView, preferredEdge: NSRectEdge, behavior: NSPopover.Behavior)
        case transitionTo(toViewController: NSViewController, options: NSViewController.TransitionOptions)
        case animator(destination: NSViewController, animator: NSViewControllerPresentationAnimator)
    }

    /// Present this view controller using parent controller.
    public func present(_ mode: PresentationMode) {
        switch mode {
        case let .asSheet(destination):
            rootViewController.presentAsSheet(destination)
        case let .asModalWindow(destination):
            rootViewController.presentAsModalWindow(destination)
        case let .asPopover(destination, positioningRect, positioningView, preferredEdge, behavior):
            rootViewController.present(destination, asPopoverRelativeTo: positioningRect, of: positioningView, preferredEdge: preferredEdge, behavior: behavior)
        case let .transitionTo(toViewController, options):
            rootViewController.transition(from: rootViewController, to: toViewController, options: options, completionHandler: nil)
        case let .animator(destination, animator):
            rootViewController.present(destination, animator: animator)
        }
    }
    
    public func dismiss() {
        rootViewController.dismiss(self)
    }
}

#endif
