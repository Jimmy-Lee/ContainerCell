import SwiftUI

extension Account {
    var displayStatus: String {
        switch status {
        case .free:
            return "Free"
        case .premium:
            return "Premium"
        }
    }
}

struct AccountView: View {
    let account: Account

    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(systemName: account.status == .premium ? "person.crop.circle" : "person.crop.circle.badge.exclam")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 44, height: 44)
            VStack(alignment: .leading) {
                Text(account.name)
                    .font(.title)
                Text(account.email)
                Text(account.displayStatus)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AccountView(account: .init(name: "Jimmy Lee", email: "jimmylevelup@gmail.com", status: .premium))
            AccountView(account: .init(name: "New User", email: "user@gmail.com", status: .free))
        }
    }
}
