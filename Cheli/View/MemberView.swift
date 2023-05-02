//
//  MemberView.swift
//  Cheli
//
//  Created by Tea Sakic on 24.04.2023..
//

import SwiftUI

struct MemberView: View {
    var name: String = "John Doe"
    
    var body: some View {
        HStack(spacing: 8) {
            //-TODO: Napraviti slikice s inicijalima
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
