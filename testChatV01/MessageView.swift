//
//  MessageView.swift
//  testChatV01
//
//  Created by Amit Gupta on 9/23/23.
//

import SwiftUI

struct MessageView: View {
    var message: ChatMessage
    var body: some View {
            HStack{
                    if message.sender == .me{Spacer()}
                    Text(message.content)
                        .foregroundColor(message.sender == .me ? .white : nil)
                        .padding()
                        .background(message.sender == .me ? .blue : .gray.opacity(0.4))
                        .cornerRadius(24)
                    if message.sender == .chatGPT{Spacer()}
            }
        }
           
}
 
struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
