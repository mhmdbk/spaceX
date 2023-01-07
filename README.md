# SpaceX Technical Task

iOS  application  that presents information about successful SpaceX launches.

[![Swift Version][swift-image]][swift-url]  [![codecov.io](https://coveralls.io/repos/github/saeed3e/Build-status-and-code-coverage-badge/badge.svg?branch=master)](https://github.com/n7down/JacocoCodeCoverageBadge/blob/master/images/badge.png)

# Requirements
* Xcode 13.4
* iOS 14.0 and above

# App architecture

1. The app uses *Coordinator pattern* presented by Soroush Khanlou: http://khanlou.com/2015/01/the-coordinator/. This pattern is widely used in iOS community and makes unit testing easier. Basically we're doing a coordinator for each flow of the app (e.g. *AppMainFlow* - entrance to the app - informing about app, etc.)
In swift version of *Coordinator pattern* we're using code closures to inject block of codes for given actions instead of having delegate for each *UIViewController*.
2. App implements *Router* in order to handle properly *back button actions of UINavigationController*. That help us dismiss given child coordinators and to pass outcome value of given child coordinator. Link to article explaining it further: https://hackernoon.com/coordinators-routers-and-back-buttons-c58b021b32a. Each View Controller that is displayed via router needs to conform to *Presentable* protocol.
3. For dependency injection we're using protocol composition. There is DependencyProvider object that has all dependencies and is injected into all coordinators and view models. But each view model and coordinator specifies its own *typealias* for dependencies to have access only to specific dependencies. More on this approach here: http://merowing.info/2017/04/using-protocol-compositon-for-dependency-injection/

![Architecture](https://user-images.githubusercontent.com/51052591/65523198-984bc600-def4-11e9-8753-2af051aa9e91.png)

# Folder structure

* *Models* - models of app domain
* *Services* - All app's dependencies.
* *Application* - it contains AppDelegate class, DependencyProvider and the main AppCoordinator class.
* *Coordinators* - all protocols and base implementation of coordinator pattern.
* *Flows* - it contains all flows of the app. Each flow has its own Coordinator, Modules (View Controllers with View Models), Module Factory and Coordinator Factory (if it has child coordinators)
* *Protocols* - protocols used in the app
* *Utilities* - helper classes
* *Extensions* - all extensions to Apple classes
* *Resources* - it contains all graphics assets, fonts, Lottie animation files, etc.


# Coding Style guidelines

Adopted standard of coding style guidelines is *The Official raywenderlich.com Swift Style Guide* that can be found here: https://github.com/raywenderlich/swift-style-guide
Moreover each developer should pay attention to the code he writes:
* There should not be any force unwrapping in code . We're using optional unwrapping in order to prevent crashes of production app and to not disturb user experience.
* There should be empty line after *imports* and before *class, struct, enum* definition.
* There should not be empty line before method name and first line of method body
* There should not be any spaces before opening or closing brackets
* There should not be any trailing white spaces in new lines

[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/


![](demo.gif)
