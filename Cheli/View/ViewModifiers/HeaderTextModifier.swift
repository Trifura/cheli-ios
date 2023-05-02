//
//  ButtonWhiteViewModifier.swift
//  Cheli
//
//  Created by Benjamin Sabo on 28.04.2023..
//

import SwiftUI

struct HeaderTextViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("HeaderText"))
            .font(.system(size: 32))
    }
}
