import SwiftUI

struct CommentScreen: View {
    @State private var commentText: String = ""
    @State private var showComment: Bool = false
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    CommentsTextView()
                    if (showComment == true) {
                        CommentView(initials: "EK", username: "emica", comment: "hahahah bravo niki")
                    }
                    CommentView(initials: "IM", username: "mikla", comment: "nema sanse da si ti to napravila 🤣")
                    CommentView(initials: "BS", username: "sabo", comment: "👏👏👏")
                }
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            AddCommentView(initials: "EK", showComment: $showComment)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct CommentScreen_Previews: PreviewProvider {
    static var previews: some View {
        CommentScreen()
    }
}
