//
//  RegisterView.swift
//  Cheli
//
//  Created by Benjamin Sabo on 30.04.2023..
//

import SwiftUI

struct RegisterView: View {
    @State private var fullName: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showErrorAlert = false
    
    @ObservedObject var viewModel: UserViewModel = UserViewModel()
    @EnvironmentObject var userStore: UserStore
    
    var body: some View {
        VStack{
            
            
            Text("Create an account ✏️")
                .padding(.top, 24)
                .modifier(HeaderTextViewModifier())
            
            
            Text("Please enter your full name, username, email address and password. If you forget it, then you have to do forgot password.")
                .modifier(MarginViewModifier())
                .padding(.top, 20)
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
            
            
            
            Group{
                Text("Full Name")
                    .modifier(FormTextViewModifier())
                    .padding(.top, 32)
                TextField("Enter your full name", text: $fullName)
                    .modifier(MarginViewModifier())
                Divider()
                    .foregroundColor(Color("primary500"))
                    .modifier(MarginViewModifier())
            }
            
            Group{
                Text("Username")
                    .modifier(FormTextViewModifier())
                    .padding(.top, 32)
                TextField("Enter your username", text: $username)
                    .modifier(MarginViewModifier())
                    .autocapitalization(.none)
                Divider()
                    .foregroundColor(Color("primary500"))
                    .modifier(MarginViewModifier())
            }
            
            Group{
                Text("Email")
                    .modifier(FormTextViewModifier())
                    .padding(.top, 32)
                TextField("Enter your email", text: $email)
                    .modifier(MarginViewModifier())
                    .autocapitalization(.none)
                Divider()
                    .foregroundColor(Color("primary500"))
                    .modifier(MarginViewModifier())
            }
            
            
            Group{
                Text("Password")
                    .modifier(FormTextViewModifier())
                    .padding(.top, 32)
                SecureField("Enter your password", text: $password)
                    .modifier(MarginViewModifier())
                Divider()
                    .foregroundColor(Color("primary500"))
                    .modifier(MarginViewModifier())
            }
            
        }
        
        
        
        Spacer()
        
        Button {
            viewModel.registerUser(fullName:fullName, username: username, email: email, password: password) { success in
                if success {
                    print("Register successful")
                    userStore.setMainUser()
                    userStore.isLogged = true
                } else {
                    print("Register failed")
                    showErrorAlert = true
                }
            }
        }label: {
            Text("SIGN IN")
                .frame(maxWidth: .infinity)
        }
        .modifier(ButtonViewModifier())
        .alert(isPresented: $showErrorAlert) {
            Alert(
                title: Text("Register Failed"),
                message: Text("Try again later."),
                dismissButton: .default(Text("OK"))
            )
        }
        .frame(maxWidth: .infinity)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
