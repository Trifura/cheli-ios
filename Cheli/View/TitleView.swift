//
//  TitleView.swift
//  Cheli
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack(spacing: 17) {
            Image("logo")
                .resizable()
                .frame(width: 24, height: 24)
            Text("Cheli")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color("grey900"))
            Spacer()
            NavigationLink(destination: (FollowRequestsView())){
                Image("add_user")
                    .frame(width: 24, height: 24)
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
