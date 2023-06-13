

import SwiftUI

struct MarginViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.leading, 24)
            .padding(.trailing, 24)
            .frame(maxWidth: .infinity, alignment: .leading)

    }
}
