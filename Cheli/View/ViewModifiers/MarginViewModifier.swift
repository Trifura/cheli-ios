//
//  ButtonWhiteViewModifier.swift
//  Cheli
//
//  Created by Benjamin Sabo on 28.04.2023..
//

import SwiftUI

struct MarginViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.leading, 24)
            .padding(.trailing, 24)
            .frame(maxWidth: .infinity, alignment: .leading)

    }
}
