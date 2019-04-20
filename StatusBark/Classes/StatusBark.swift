//
//  UIViewController+StatusBar.swift
//  JTIQuiz
//
//  Created by Fyodor Volchyok on 4/12/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit


@objc public protocol StatusBarCustomizable {
    
    @objc var statusBarStyle: UIStatusBarStyle { get }
    
}


extension UIViewController: StatusBarCustomizable {
    
    open var statusBarStyle: UIStatusBarStyle {
        return globalStatusBarStyle_
    }
    
}


public class StatusBark {
    
    public static var shared: StatusBark = {
        return StatusBark()
    }()
    
    public var globalStatusBarStyle: UIStatusBarStyle {
        get {
            return globalStatusBarStyle_
        }
        set {
            globalStatusBarStyle_ = newValue
        }
    }
    
    private init() {
        UIViewController.swizzle()
    }
    
}


extension UINavigationController {
    
    override open var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
}


// MARK: - Private

private var globalStatusBarStyle_: UIStatusBarStyle = .default


@objc private extension UIViewController {
    
    @objc func statusBarStyle_() -> UIStatusBarStyle {
        return statusBarStyle
    }
    
    static func swizzle() {
        if self != UIViewController.self {
            return
        }
        
        let originalSelector = #selector(getter: UIViewController.preferredStatusBarStyle)
        let swizzledSelector = #selector(UIViewController.statusBarStyle_)
        
        let originalMethod = class_getInstanceMethod(self, originalSelector)!
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)!
        
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
    
}
