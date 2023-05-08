//
//  LoginView.swift
//  Cheli
//
//  Created by Benjamin Sabo on 30.04.2023..
//

import SwiftUI



struct LoginView: View {
    @State private var email: String = ""
    @State private var pass: String = ""
    
    var body: some View {
        VStack{
            
          BackView()
                .padding(.top, 24)
            Text("Hello there 👋")
                .padding(.top, 20)
                .modifier(HeaderTextViewModifier())
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Email")
                .modifier(FormTextViewModifier())
                .padding(.top, 32)
            TextField("example@example.com", text: $email)
                .modifier(MarginViewModifier())
            
            
            Text("Password")
                .modifier(FormTextViewModifier())
                .padding(.top, 32)
            SecureField("Password", text: $pass)
                .modifier(MarginViewModifier())
            Spacer()
            Button("SIGN IN") {
                print("Button pressed")
            }
                .modifier(ButtonViewModifier())
        }
    }
}




struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
