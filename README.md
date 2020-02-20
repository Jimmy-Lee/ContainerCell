# ContainerCell

Wrap a UIView/UIViewController inside a container view.

## What is this?

A view may appear on its own, or put inside container like UITableViewCell. When you want to reuse your View without creating a dedicated UITableViewCell subclass, you can do this with ContainerCell.

Now it offers wrapping UIView/UIViewController inside UITableViewCell

``` Swift
class UIViewCell<Content: UIView>: UITableViewCell { ... }
class UIViewControllerCell<Content: UIViewController>: UITableViewCell { ... }
```

## SwiftUI interoperability

You can wrap a SwiftUI `View` inside an `UIHostingController`, and put it inside UIViewControllerCell. But if you are building a pure SwiftUI interface, you should use SwiftUI directly.

## Usage

Please refer to example project. It demonstrates SwiftUI and UIKit usage.
