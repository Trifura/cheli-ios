


import SwiftUI

struct ImageView: View {
    var body: some View {
        ZStack {
            Color.black
            
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    Color.green
                    //Image()
                        .frame(height: min(geometry.size.width, geometry.size.height))
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        }
    }
}



struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
