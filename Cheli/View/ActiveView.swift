//
//  ActiveView.swift
//  Cheli
//

import SwiftUI

struct ActiveView: View {
    var myCheli : FeedItem
   // var time: String = "23 hours left"
  //  var challenge: String = "Say Something Nice To\n5 People Today "
    
    @State var is_completed: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            Text(myCheli.challenge.createdAt?.human ?? "")
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .foregroundColor(Color("primary500"))
                .frame(width: 116, height: 32)
                .background(.white)
                .cornerRadius(100)
            
            Text(myCheli.challenge.title)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .lineSpacing(16)
                //TODO Text se ne prikazuje cijeli kada se postavi padding
                /*.padding(.vertical, 16)
                .lineLimit(nil)*/
            
            Text(myCheli.challenge.description)
                .font(.system(size: 14))
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.leading)
            
            
            Button(action: {
                is_completed.toggle()
            }) {
                Text(is_completed ? "Completed" : "Complete")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 220, height: 32)
                    .background(Color(is_completed ? "grey700" : "primary500"))
                    .cornerRadius(100)
            }
        }
        .frame(maxWidth: .infinity,  alignment: .leading)
    }
}

struct ActiveView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveView(myCheli: FeedItem(data: [:]))
    }
}
