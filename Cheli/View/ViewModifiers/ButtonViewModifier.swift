

import SwiftUI

struct ButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 380.0, height: 50.0)
            .background(Color("primary500"))
            .mask(RoundedRectangle(cornerRadius: 100))
            .font(.system(size: 16))
            .foregroundColor(Color("button1Color"))
            .contentShape(Rectangle())
    }
}


