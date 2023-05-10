//
//  ButtonViewModifier.swift
//  Cheli
//
//  Created by Benjamin Sabo on 27.04.2023..
//

import SwiftUI

struct ButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 380.0, height: 50.0)
            .background(Color("Primary500"))
            .mask {
                RoundedRectangle(cornerRadius: 100)
            }
            .frame(maxWidth: .infinity)
            .font(.system(size: 16))
            .foregroundColor(Color("button1Color"))
    }
}


