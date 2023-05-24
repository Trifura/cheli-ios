//
//  AddCommentView.swift
//  Cheli
//
//  Created by Students on 24.05.2023..
//

import SwiftUI

struct AddCommentView: View {
    let initials: String
    @State private var commentText: String = ""
    
    var body: some View {
        VStack {
            Divider()
                .padding(.top, -8) 
            HStack {
                Image("")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .background(Color.red)
                    .mask(Circle().frame(height: 50).foregroundColor(.red))
                    .overlay(
                        Text(initials)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                    )
                
                ZStack(alignment: .trailing) {
                    TextField("Add a comment", text: $commentText)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical, 10)
                        .padding(.leading, 20)
                    
                    if !commentText.isEmpty {
                        Button(action: {
                            // Handle comment submission
                            submitComment()
                        }) {
                            Text("Post")
                                .foregroundColor(.blue)
                        }
                        .padding(.trailing, 20)
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
            .padding(.horizontal, 24) // Apply horizontal padding to the HStack
        }
    }
    
    func submitComment() {
        // Perform necessary actions with the submitted comment
        print("Comment submitted: \(commentText)")
        
        // Clear the comment input field
        commentText = ""
    }
}


struct AddCommentView_Previews: PreviewProvider {
    static var previews: some View {
        AddCommentView(initials: "JD")
    }
}
