import ContainerCell
import UIKit

final class UIKitExampleViewController: UITableViewController {
    let accounts = Account.demo

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "UIKit Example"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accounts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an UIViewControllerContainerCell,
        // then create an AccountViewController from nib,
        // then assign to cell.content
        let cell = UIViewControllerCell<AccountViewController>.dequeue(in: tableView)
        cell.content.configure(with: accounts[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Accounts"
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let accountSettingVC = AccountSettingViewController(account: accounts[indexPath.row])
        accountSettingVC.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissPresented))
        let nav = UINavigationController(rootViewController: accountSettingVC)
        present(nav, animated: true, completion: nil)
    }

    @objc private func dismissPresented() {
        dismiss(animated: true, completion: nil)
    }
}
