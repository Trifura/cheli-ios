//
//  CommentScreen.swift
//  Cheli
//
//  Created by Students on 22.05.2023..
//

import SwiftUI

struct CommentScreen: View {
    var body: some View {
        ScrollView {
            VStack {
                CommentsTextView()
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct CommentScreen_Previews: PreviewProvider {
    static var previews: some View {
        CommentScreen()
    }
}
