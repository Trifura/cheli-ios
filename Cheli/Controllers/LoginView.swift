import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @ObservedObject var viewModel: UserViewModel = UserViewModel()
    
    var body: some View {
        VStack {
            Text("Hello there 👋").padding(.top, 20)
                .modifier(HeaderTextViewModifier())
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Email").modifier(FormTextViewModifier()).padding(.top, 32)
            TextField("example@example.com", text: $email).modifier(MarginViewModifier())
            Text("Password").modifier(FormTextViewModifier()).padding(.top, 32)
            SecureField("Password", text: $password).modifier(MarginViewModifier())
            Spacer()
            Button("SIGN IN") {
                NavigationView()
                /*viewModel.loginUser(username: email, password: password) { success in
                    if success {
                        print("Login successful")
                        
                    } else {
                        print("Login failed")
                        // TODO: - Show error message to user
                    }
                }*/
            
            }.modifier(ButtonViewModifier())
        }
    }
}
