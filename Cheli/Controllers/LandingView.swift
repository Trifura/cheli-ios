import SwiftUI
import Combine

struct LandingView: View {
    @EnvironmentObject var userStore: UserStore
    @State private var isPresentingRegistration = false
    @State private var isPresentingLogin = false
    
    var body: some View {
        ZStack {
            if !userStore.isLogged {
                VStack {
                    Image("log_img")
                        .padding(.top, 16)
                    
                    Text("Challenge yourself wherever you are!")
                        .modifier(HeaderTextViewModifier())
                        .padding(.top, 50)
                        .padding(.bottom, 120)
                    
                    VStack {
                        Button(action: {
                            isPresentingRegistration = true
                        }) {
                            Text("GET STARTED")
                                .modifier(ButtonViewModifier())
                                .padding(.bottom, 15)
                        }
                        .sheet(isPresented: $isPresentingRegistration) {
                            RegisterView()
                        }
                        
                        Button(action: {
                            isPresentingLogin = true
                        }) {
                            Text("I ALREADY HAVE AN ACCOUNT")
                                .modifier(ButtonWhiteViewModifier())
                                .padding(.bottom, 15)
                        }
                        .sheet(isPresented: $isPresentingLogin) {
                            LoginView()
                        }
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            } else {
                NavigationView()
            }
        }
    }
}
