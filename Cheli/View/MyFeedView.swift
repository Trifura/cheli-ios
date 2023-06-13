

import SwiftUI

struct MyFeedView: View {
    var body: some View {
        HStack() {
            Text("My feed")
            .foregroundColor(Color("grey900"))
            .font(.system(size: 24))
            .fontWeight(.bold)
            
            
        }
        .padding(.vertical, 24.0)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MyFeedView_Previews: PreviewProvider {
    static var previews: some View {
        MyFeedView()
    }
}
