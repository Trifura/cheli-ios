//
//  RegisterView.swift
//  Cheli
//
//  Created by Benjamin Sabo on 30.04.2023..
//

import SwiftUI

struct RegisterView: View {
    @State private var name1: String = ""
    @State private var username1: String = ""
    @State private var email1: String = ""
    @State private var pass1: String = ""
    
    
    
    var body: some View {
        
        VStack{
            
            
           /* Text("Create an account ✏️")
                .padding(.top, 24)
                .modifier(HeaderTextViewModifier())
                .frame(maxWidth: .infinity, alignment: .leading)*/
                
           
            Text("Please enter your full name, username, email address and password. If you forget it, then you have to do forgot password.")
                .modifier(MarginViewModifier())
                .padding(.top, 20)
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
            
            
            
            
            
            Text("Full name")
                .modifier(FormTextViewModifier())
                .padding(.top, 32)
            TextField("Benjamin Sabo", text: $name1)
                .modifier(MarginViewModifier())
            
            
            
            Text("Username")
                .modifier(FormTextViewModifier())
                .padding(.top, 32)
            TextField("BenjaminSabo", text: $username1)
                .modifier(MarginViewModifier())
            
            Text("Email")
                .modifier(FormTextViewModifier())
                .padding(.top, 32)
            TextField("example@example.com", text: $email1)
                .modifier(MarginViewModifier())
            
            
            Text("Password")
                .modifier(FormTextViewModifier())
                .padding(.top, 32)
            SecureField("Password", text: $pass1)
                .modifier(MarginViewModifier())
            
            Spacer()
            
            /*Button("SIGN IN") {
                print("Button pressed")
            }
            .modifier(ButtonViewModifier())*/
          
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
