import UIKit

public class UIViewControllerCell<Content: UIViewController>: UITableViewCell {
    public init(reuseIdentifier: String? = nil) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier ?? Content.reuseIdentifier)

        // didSet is not triggered with default value
        selectedBackgroundColor = .lightGray
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// A generic UIView content.
    ///
    /// When you needs to configure content, you can either access this property or assign a new one.
    public var content: Content = .init() {
        didSet {
            contentView.subviews.forEach { $0.removeFromSuperview() }

            contentView.addSubview(content.view)
            content.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                content.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
                content.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
                content.view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
                content.view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
            ])
        }
    }

    public var selectedBackgroundColor: UIColor = .lightGray {
        didSet {
            let view = UIView()
            view.backgroundColor = selectedBackgroundColor
            selectedBackgroundView = view
        }
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        content(highlightedOrSelected: isHighlighted || selected)
    }

    override public func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)

        content(highlightedOrSelected: highlighted || isSelected)
    }

    func content(highlightedOrSelected: Bool) {
        content.set(highlightedOrSelected: highlightedOrSelected)
    }
}

extension UIViewControllerCell {
    /// A convenient method to create instance of `ContainerCell` with a `Content` inside.
    ///
    /// This convenient method may not be sufficient most of the time.
    /// For example, if has custom init function, you should use dedicated init function to set up cell.content
    ///
    /// - Parameters:
    ///   - tableView: The tableView to dequeue cell in.
    ///   - reuseIdentifier: If not provided, defaults to `Content.reuseIdentifier`.
    public static func dequeue(in tableView: UITableView, reuseIdentifier: String? = nil) -> UIViewControllerCell<Content> {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier ?? Content.reuseIdentifier) as? UIViewControllerCell<Content> {
            return cell
        } else {
            let cell = UIViewControllerCell<Content>(reuseIdentifier: reuseIdentifier ?? Content.reuseIdentifier)
            cell.content = .init() // if Content has custom init function, do not use this function
            return cell
        }
    }
}

extension UIViewController {
    /// This function is called when container's setSelected or setHighlighted is called.
    ///
    /// You have to override this if custom color scheme is required.
    /// - Parameter highlightedOrSelected: container is highlighted or selected
    @objc public func set(highlightedOrSelected: Bool) {
        view.backgroundColor = .clear
    }
}
