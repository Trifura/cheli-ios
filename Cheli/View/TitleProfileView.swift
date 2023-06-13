
import SwiftUI

struct TitleProfileView: View {
    
    var showNotificationButton: Bool = true
    var body: some View {
        HStack(spacing: 17) {
            Image("logo")
                .resizable()
                .frame(width: 24, height: 24)
            Text("Profile")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color("grey900"))
            Spacer()
            if showNotificationButton {
                NavigationLink(destination: FollowRequestsView()) {
                    Image("add_user")
                        .frame(width: 24, height: 24)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TitleProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TitleProfileView()
    }
}
