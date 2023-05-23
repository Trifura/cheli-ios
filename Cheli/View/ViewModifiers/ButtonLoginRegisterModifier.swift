//
//  ButtonLogin&RegisterModifier.swift
//  Cheli
//
//  Created by Benjamin Sabo on 23.05.2023..
//

import SwiftUI


struct ButtonLoginRegisterModifier: ViewModifier {
    var isFormComplete: Bool
    
    func body(content: Content) -> some View {
        content
            .frame(width: 380.0, height: 50.0)
            .background(isFormComplete ? Color("primary500") : Color("primary500").opacity(0.6))
            .mask(RoundedRectangle(cornerRadius: 100))
            .font(.system(size: 16))
            .foregroundColor(Color("button1Color"))
            .contentShape(Rectangle())
    }
}



