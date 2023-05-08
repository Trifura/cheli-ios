//
//  TitleFindView.swift
//  Cheli
//
//  Created by Students on 08.05.2023..
//

import SwiftUI

struct TitleFindView: View {
    var body: some View {
            HStack(spacing: 17) {
            Image("logo")
                .resizable()
                .frame(width: 24, height: 24)
            Text("Find Friends")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color("grey900"))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TitleFindView_Previews: PreviewProvider {
    static var previews: some View {
        TitleFindView()
    }
}
