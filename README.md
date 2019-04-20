# StatusBark

[![Version](https://img.shields.io/cocoapods/v/StatusBark.svg?style=flat)](https://cocoapods.org/pods/StatusBark)
[![License](https://img.shields.io/cocoapods/l/StatusBark.svg?style=flat)](https://cocoapods.org/pods/StatusBark)
[![Platform](https://img.shields.io/cocoapods/p/StatusBark.svg?style=flat)](https://cocoapods.org/pods/StatusBark)

## Overview

StatusBark helps you globally customize all view controllers' statusBarStyle from .default to .lightContent without manually changing statusBarStyle in each view controller, making custom view controllers hierarchy or using deprecated UIApplication.statusBarStyle but still allows you to change statusBarStyle for selected controllers.


![](StatusBarkDemo.gif?raw=true "StatusBark demo")

## Requirements
* iOS11

## Installation with CocoaPods

StatusBark is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'StatusBark'
```

## Usage

```Swift
import StatusBark

StatusBark.shared.globalStatusBarStyle = .lightContent

```

and if you need to revert statusBarStyle back to .default on some view controllers you use regular statusBarStyle

```Swift
class CustomizedViewController: BaseViewController {

    override var statusBarStyle: UIStatusBarStyle {
        return .default
    }

}

```

## Example Project

An example project is included with this repo.  To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Fyodor Volchyok

## License

StatusBark is available under the MIT license. See the LICENSE file for more info.
