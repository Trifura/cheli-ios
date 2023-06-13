
import SwiftUI

struct CommentsTextView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Comments")
                    .foregroundColor(Color("grey900"))
                    .font(.system(size: 24))
                    .fontWeight(.bold)
            }
            .padding(.vertical, 24.0)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct CommentsTextView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsTextView()
    }
}
