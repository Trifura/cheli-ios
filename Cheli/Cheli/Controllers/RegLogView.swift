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
                .padding(.top, 65)
                .padding(.bottom, 125)
            VStack(){
                Button("GET STARTED"){
                    print("Button pressed")
                }
                .foregroundColor(.white)
                .modifier(ButtonViewModifier())
                .padding(.bottom, 15)
                Button("I ALREADY HAVE AN ACCOUNT") {
                    print("Button pressed")
                }
                
                .modifier(ButtonWhiteViewModifier())
            
            }
            
        }
    }
}

struct RegLogView_Previews: PreviewProvider {
    static var previews: some View {
        RegLogView()
    }
}
