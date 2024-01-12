#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit

public typealias View = NSView
public typealias ViewController = NSViewController
public typealias Storyboard = NSStoryboard
public typealias StackView = NSStackView
public typealias StackViewOrientationOrAxis = NSUserInterfaceLayoutOrientation
public typealias LayoutConstraintOrientationOrAxis = NSLayoutConstraint.Orientation
public typealias LayoutPriority = NSLayoutConstraint.Priority
public typealias StackViewAlignment = NSLayoutConstraint.Attribute
public typealias StackViewDistribution = StackView.Distribution
public typealias EdgeInsets = NSEdgeInsets
public typealias LayoutGuide = NSLayoutGuide
public typealias Color = NSColor
public typealias BezierPath = NSBezierPath
#endif

#if canImport(UIKit)
import UIKit

public typealias View = UIView
public typealias ViewController = UIViewController
public typealias Storyboard = UIStoryboard
public typealias StackView = UIStackView
public typealias StackViewOrientationOrAxis = NSLayoutConstraint.Axis
public typealias StackViewAlignment = StackView.Alignment
public typealias StackViewDistribution = StackView.Distribution
public typealias LayoutPriority = UILayoutPriority
public typealias LayoutConstraintOrientationOrAxis = NSLayoutConstraint.Axis
public typealias EdgeInsets = UIEdgeInsets
public typealias LayoutGuide = UILayoutGuide
public typealias Color = UIColor
public typealias BezierPath = UIBezierPath
#endif
