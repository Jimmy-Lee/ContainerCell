import ContainerCell
import SwiftUI
import UIKit

final class SwiftUIExampleViewController: UITableViewController {
    let accounts = Account.demo

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SwiftUI Example"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accounts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "AccountCell") as? UIViewControllerCell) ?? UIViewControllerCell(reuseIdentifier: "AccountCell")
        // We have to create SwiftUI View every time when view content has changed
        let view = AccountView(account: accounts[indexPath.row])
        cell.content = UIHostingController(rootView: view)
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Accounts"
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let accountSettingVC = UIHostingController(rootView: AccountSettingView(account: accounts[indexPath.row]))
        accountSettingVC.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissPresented))
        let nav = UINavigationController(rootViewController: accountSettingVC)
        present(nav, animated: true, completion: nil)
    }

    @objc private func dismissPresented() {
        dismiss(animated: true, completion: nil)
    }
}
