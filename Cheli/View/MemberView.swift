//
//  MemberView.swift
//  Cheli
//

import SwiftUI

struct MemberView: View {
    let fullName: String
    let initials: String
    
    var body: some View {
        HStack(spacing: 8) {
            // TODO Inicijali
            // Image()
            // .backgrounbd()
            // .mask {Circle()}
            
            NavigationLink(destination: (ClickedUserView())){
                Image("")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .background(Color("primary500"))
                    .mask(Circle().frame(height: 20).foregroundColor(Color("primary500")))
                
                    .overlay(
                        Text(initials)
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                    )
            }
            
            NavigationLink(destination: (ClickedUserView())){
                Text(fullName)
                    .font(.system(size: 12))
                    .foregroundColor(Color("dark4"))
            }
        }
    }
}

struct MemberView_Previews: PreviewProvider {
    static var previews: some View {
        MemberView(fullName: "John Doe", initials: "JD")
    }
}
