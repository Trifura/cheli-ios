//
//  FollowRequestsTextView.swift
//  Cheli
//
//  Created by Students on 19.05.2023..
//

import SwiftUI

struct FollowRequestsTextView: View {
    var body: some View {
        HStack {
            Text("Notifications")
                .foregroundColor(Color("grey900"))
                .font(.system(size: 24))
                .fontWeight(.bold)
        }
        .padding(.vertical, 24.0)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FollowRequestsTextView_Previews: PreviewProvider {
    static var previews: some View {
        FollowRequestsTextView()
    }
}
