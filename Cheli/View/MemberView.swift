//
//  MemberView.swift
//  Cheli
//

import SwiftUI

struct MemberView: View {
    var name: String = "John Doe"
    
    var body: some View {
        HStack(spacing: 8) {
            // Image()
            // .backgrounbd()
            // .mask {Circle()}
            
            Image("member")
            Text(name)
                .font(.system(size: 12))
                .foregroundColor(Color("dark4"))
         
        }
    }
}

struct MemberView_Previews: PreviewProvider {
    static var previews: some View {
        MemberView()
    }
}
