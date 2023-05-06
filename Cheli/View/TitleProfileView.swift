//
//  TitleProfileView.swift
//  Cheli
//
//  Created by Temp Guest on 02.05.2023..
//

import SwiftUI

struct TitleProfileView: View {
    var body: some View {
        HStack(spacing: 17) {
            Image("logo")
                .resizable()
                .frame(width: 24, height: 24)
            Text("Profile")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color("grey900"))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TitleProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TitleProfileView()
    }
}