import UIKit

class AccountViewController: UIViewController {
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var emailLabel: UILabel!
    @IBOutlet private var statusLabel: UILabel!

    func configure(with account: Account) {
        let imageName = account.status == .premium ? "person.crop.circle" : "person.crop.circle.badge.exclam"
        imageView.image = UIImage(systemName: imageName)

        nameLabel.text = account.name
        emailLabel.text = account.email
        statusLabel.text = account.displayStatus
    }
}
