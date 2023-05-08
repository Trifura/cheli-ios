//
//  MemberView.swift
//  Cheli
//

import SwiftUI

struct MemberView: View {
    let fullName: String
    
    var body: some View {
        HStack(spacing: 8) {
            // TODO Inicijali
            // Image()
            // .backgrounbd()
            // .mask {Circle()}
            
            Image("member")
            Text(fullName)
                .font(.system(size: 12))
                .foregroundColor(Color("dark4"))
         
        }
    }
}

struct MemberView_Previews: PreviewProvider {
    static var previews: some View {
        MemberView(fullName: "John Doe")
    }
}
