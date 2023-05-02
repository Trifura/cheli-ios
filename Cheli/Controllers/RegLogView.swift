//
//  RegLogView.swift
//  Cheli
//
//  Created by Benjamin Sabo on 26.04.2023..
//

import SwiftUI


struct RegLogView: View {
    var body: some View {
        VStack(){
            Image("log-img")
                .padding(.top, 16)
            
            Text("Challenge yourself wherever you are!")
                .modifier(HeaderTextViewModifier())
                .padding(.top, 50)
                .padding(.bottom, 125)
            
            VStack(){
                Button("GET STARTED"){
                    print("Button pressed")
                }
                .modifier(ButtonViewModifier())
                .padding(.bottom, 15)
                Button("I ALREADY HAVE AN ACCOUNT") {
                    print("Button pressed")
                }
                .modifier(ButtonWhiteViewModifier())
                .padding(.bottom, 15)
            }
            
        }
    }
}

struct RegLogView_Previews: PreviewProvider {
    static var previews: some View {
        RegLogView()
    }
}
