//
//  ButtonLogOut.swift
//  Cheli
//
//  Created by Students on 11.05.2023..
//

import SwiftUI

struct ButtonLogOut: View {
    var body: some View {
        Button(action: {
            userStore.isLogged = false
        }) {
            Text("Sign out")
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
                .padding(.vertical, 6)
                .background(Color("logOut"))
                .foregroundColor(.white)
                .cornerRadius(100)
        }    }
}

struct ButtonLogOut_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLogOut()
    }
}
