import UIKit

class AccountSettingViewController: UIViewController {
    private let account: Account
    init(account: Account) {
        self.account = account

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = account.name

        view.backgroundColor = .systemBackground

        let accountVC = AccountViewController()
        addChild(accountVC)
        view.addSubview(accountVC.view)
        accountVC.didMove(toParent: self)
        accountVC.configure(with: account)
        accountVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            accountVC.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            accountVC.view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            accountVC.view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])

        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: accountVC.view.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension AccountSettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        cell.textLabel?.text = "Title"
        cell.detailTextLabel?.text = "Value"
        return cell
    }
}
