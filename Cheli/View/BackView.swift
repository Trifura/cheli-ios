
import SwiftUI

struct BackView: View {
    var body: some View {
        HStack(spacing: 17){
            
            Button(action:{
                print("Button was pressed")
            }){
                Image("left_arrow")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 24)
        
    }
}

struct BackView_Previews: PreviewProvider {
    static var previews: some View {
        BackView()
    }
}
