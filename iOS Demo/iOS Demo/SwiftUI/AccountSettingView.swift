import SwiftUI

struct AccountSettingView: View {
    let account: Account

    var body: some View {
        VStack {
            AccountView(account: account)
                .padding()
            List(0..<5) { _ in
                HStack {
                    Text("Title")
                    Spacer()
                    Text("Value")
                }
            }
        }
            .navigationBarTitle(Text(account.name))
    }
}

struct AccountSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingView(account: Account.demo.first!)
    }
}
