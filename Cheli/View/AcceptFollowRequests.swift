//
//  AcceptFollowRequests.swift
//  Cheli
//
//  Created by Students on 19.05.2023..
//

import SwiftUI

struct AcceptFollowRequests: View {
    let initials: String
    var fullName: String
    var username: String
    
    var body: some View {
        HStack {
            Image("")
                .resizable()
                .frame(width: 60, height: 60)
                .background(Color.red)
                .mask(Circle().frame(height: 50).foregroundColor(.red))
                .overlay(
                    Text(initials)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                )
            
            VStack(alignment: .leading) {
                
                Text(fullName)
                    .font(.system(size: 15, weight: .bold))
                +
                Text(" requested to follow you.")
                    .font(.system(size: 15))
                    .foregroundColor(Color("grey900"))
                
                    /*.padding(.bottom, 0.5)
                Text("@"+username)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color("grey700"))*/
                
            }
            //.padding(.leading, 10)
            Spacer()
            Button(action: {
                //Napraviti logiku
            }) {
                Text("Accept")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color("accept"))
                    .foregroundColor(.white)
                    .cornerRadius(100)
            }
            
            Button(action: {
                //Napraviti logiku
            }) {
                Text("Delete")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color("delete"))
                    .foregroundColor(Color("blackWhite"))
                    .cornerRadius(100)
            }
            
        }
    }
}
    
    struct AcceptFollowRequests_Previews: PreviewProvider {
        static var previews: some View {
            AcceptFollowRequests(initials: "JD", fullName: "John Doe", username: "johndoe")
        }
    }
