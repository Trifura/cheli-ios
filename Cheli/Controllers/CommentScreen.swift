
import SwiftUI

struct CommentScreen: View {
    @State private var commentText: String = ""
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    CommentsTextView()
                    CommentView(initials: "JK", username: "johndoe", comment: "This is a comment.")
                }
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            AddCommentView(initials: "JK")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct CommentScreen_Previews: PreviewProvider {
    static var previews: some View {
        CommentScreen()
    }
}
