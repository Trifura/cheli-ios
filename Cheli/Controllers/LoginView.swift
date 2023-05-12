import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @ObservedObject var viewModel: UserViewModel = UserViewModel()
    // @State private var isLoggedIn = false
    @EnvironmentObject var userStore: UserStore
    @State private var showErrorAlert = false
    
    var body: some View {
        SwiftUI.NavigationView {
            VStack {
                Text("Hello there 👋").padding(.top, 20)
                    .modifier(HeaderTextViewModifier())
                Text("Username").modifier(FormTextViewModifier()).padding(.top, 32)
                TextField("Enter username", text: $username).modifier(MarginViewModifier())
                    .autocapitalization(.none)
                Divider()
                    .foregroundColor(Color("primary500"))
                    .modifier(MarginViewModifier())
                
                
                Text("Password").modifier(FormTextViewModifier()).padding(.top, 32)
                SecureField("Enter password", text: $password).modifier(MarginViewModifier())
                Divider()
                    .foregroundColor(Color("primary500"))
                    .modifier(MarginViewModifier())
                Spacer()
                
                Button {
                    viewModel.loginUser(username: username, password: password) { success in
                        if success {
                            print("Login successful")
                            userStore.setMainUser()
                            userStore.isLogged = true
                        } else {
                            print("Login failed")
                            showErrorAlert = true
                        }
                    }
                }label: {
                    Text("LOGIN")
                        .frame(maxWidth: .infinity)
                }
                .modifier(ButtonViewModifier())
                .alert(isPresented: $showErrorAlert) {
                    Alert(
                        title: Text("Login Failed"),
                        message: Text("Try again later."),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}
