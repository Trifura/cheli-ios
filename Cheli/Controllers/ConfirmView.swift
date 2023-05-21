import SwiftUI

struct ConfirmView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showLoginView = false
    
    var body: some View {
        VStack {
            Text("Confirm your e-mail!")
            
            Text("Go to Login")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .onTapGesture {
                    showLoginView = true
                }
                .fullScreenCover(isPresented: $showLoginView) {
                    SwiftUI.NavigationView {
                        LoginView()
                            .navigationBarHidden(true)
                    }
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}
