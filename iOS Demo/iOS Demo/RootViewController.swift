import UIKit

final class RootViewController: UITableViewController {
    enum Example: CaseIterable {
        case swiftUI
        case uiKit

        var displayName: String {
            switch self {
            case .swiftUI:
                return "Swift UI"
            case .uiKit:
                return "UIKit"
            }
        }
    }

    private let cases = Example.allCases

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = cases[indexPath.row].displayName
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: UIViewController
        switch cases[indexPath.row] {
        case .swiftUI:
            vc = SwiftUIExampleViewController(style: .grouped)
        case .uiKit:
            vc = UIKitExampleViewController(style: .grouped)
        }

        navigationController?.pushViewController(vc, animated: true)
    }
}
