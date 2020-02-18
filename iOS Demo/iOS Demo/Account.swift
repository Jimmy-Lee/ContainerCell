import Foundation

struct Account {
    enum Status {
        case free
        case premium
    }

    let name: String
    let email: String
    let status: Status
}

extension Account {
    static var demo: [Account] {
        return [Account(name: "Jimmy Lee", email: "jimmylevelup@gmail.com", status: .premium)]
            +
        (1...10).map { index in
            Account(name: "User\(index)", email: "user\(index)@gmail.com", status: .free)
        }

    }
}
