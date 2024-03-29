

import SwiftUI

struct CheliView: View {
    var body: some View {
        HStack() {
            Text("Past Cheli's")
            .foregroundColor(Color("grey900"))
            .font(.system(size: 24))
            .fontWeight(.bold)
        
        }
        .padding(.vertical, 24.0)
        .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

struct CheliView_Previews: PreviewProvider {
    static var previews: some View {
        CheliView()
    }
}
