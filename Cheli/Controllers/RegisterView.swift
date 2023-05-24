import SwiftUI

struct RegisterView: View {
    @State private var fullName: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isPasswordValid: Bool = true
    @State private var showErrorAlert = false
    @State private var showConfirmView = false
    
    @ObservedObject var viewModel: UserViewModel = UserViewModel()
    @EnvironmentObject var userStore: UserStore
    
    
    
    var isFormComplete: Bool {
        return !fullName.isEmpty && !username.isEmpty && !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
    }
    
    
    var body: some View {
        SwiftUI.NavigationView {
            VStack {
                Text("Create an account ✏️")
                    .padding(.top, 24)
                    .modifier(HeaderTextViewModifier())
                
                Text("Please enter your full name, username, email address, and password. If you forget it, then you have to do forgot password.")
                    .modifier(MarginViewModifier())
                    .padding(.top, 20)
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                // Full Name
                Group {
                    Text("Full Name")
                        .modifier(FormTextViewModifier())
                        .padding(.top, 32)
                    TextField("Enter your full name", text: $fullName)
                        .modifier(MarginViewModifier())
                    Divider()
                        .foregroundColor(Color("primary500"))
                        .modifier(MarginViewModifier())
                }
                
                // Username
                Group {
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
                
                // Email
                Group {
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
                
                // Password
                Group {
                    Text("Password")
                        .foregroundColor(isPasswordValid ? .primary : .red)
                        .modifier(FormTextViewModifier())
                        .padding(.top, 32)
                    SecureField("Enter your password", text: $password)
                        .modifier(MarginViewModifier())
                    Divider()
                        .foregroundColor(Color("primary500"))
                        .modifier(MarginViewModifier())
                }
                
                // Confirm Password
                Group {
                    Text("Confirm Password")
                        .foregroundColor(isPasswordValid ? .primary : .red)
                        .modifier(FormTextViewModifier())
                        .padding(.top, 32)
                    SecureField("Confirm your password", text: $confirmPassword)
                        .modifier(MarginViewModifier())
                    Divider()
                        .foregroundColor(Color("primary500"))
                        .modifier(MarginViewModifier())
                }
                
                Spacer()
                
                NavigationLink(destination: ConfirmView(), isActive: $showConfirmView) {
                    Button {
                        if password == confirmPassword {
                            viewModel.registerUser(fullName: fullName, username: username, email: email, password: password, confirmPassword: confirmPassword) { success in
                                if success {
                                    print("Register successful")
                                    showConfirmView = true // Navigate to ConfirmView
                                } else {
                                    print("Register failed")
                                    showErrorAlert = true
                                }
                            }
                        } else {
                            isPasswordValid = false
                        }
                    } label: {
                        Text("SIGN IN")
                            .frame(maxWidth: .infinity)
                    }
                    .modifier(ButtonLoginRegisterModifier(isFormComplete: isFormComplete))
                    .frame(maxWidth: .infinity)
                }
                .disabled(!isFormComplete)
            }
            
            .navigationBarHidden(true)
            .padding(.horizontal)
            .navigationBarBackButtonHidden(true)
        }
    }
}
