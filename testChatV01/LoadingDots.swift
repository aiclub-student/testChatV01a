//
//  LoadingDots.swift
//  testChatV01
//
//  Created by Amit Gupta on 9/23/23.
//

import SwiftUI

enum Constants {
    static let OpenAIAPIKey = "sk-123456789012345678901234567890123456789012345678"
}
 
struct LoadingDots: View {
    @State private var loadingDot: Bool = false
    
    let reloadScreen = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            HStack(spacing: 3) {
                HStack(spacing: 5) {
                    Rectangle()
                        .frame(width: 7, height: 7)
                        .offset(y: 9)
                        .opacity(loadingDot ? 1 : 0)
                        .animation(.linear(duration: 0.5), value: loadingDot)
                    
                    Rectangle()
                        .frame(width: 7, height: 7)
                        .offset(y: 9)
                        .opacity(loadingDot ? 1 : 0)
                        .animation(.linear(duration: 0.5).delay(0.5), value: loadingDot)
                    
                    Rectangle()
                        .frame(width: 7, height: 7)
                        .offset(y: 9)
                        .opacity(loadingDot ? 1 : 0)
                        .animation(.linear(duration: 0.5).delay(1), value: loadingDot)
                }
            }
        }
        .onReceive(reloadScreen, perform: { _ in
            loadingTheDots()
        })
        .onAppear {
            loadingTheDots()
        }
    }
    
    func loadingTheDots() {
        loadingDot = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            loadingDot = false
        }
    }
}

struct LoadingDots_Previews: PreviewProvider {
    static var previews: some View {
        LoadingDots()
    }
}
