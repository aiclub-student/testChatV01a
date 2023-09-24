//
//  ChatMessageModel.swift
//  testChatV01
//
//  Created by Amit Gupta on 9/23/23.
//

import Foundation

struct ChatMessage {
    let id: String
    let content: String
    let createdAt: Date
    let sender: MessageSender
}

enum MessageSender {
    case me
    case chatGPT
}

 

extension ChatMessage {
    static let sampleMessages = [
        ChatMessage(id: UUID().uuidString, content: "Sample message from me", createdAt: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Sample message from chatGPT", createdAt: Date(), sender: .chatGPT),
        ChatMessage(id: UUID().uuidString, content: "Sample message from me", createdAt: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Sample message from chatGPT", createdAt: Date(), sender: .chatGPT),
        ChatMessage(id: UUID().uuidString, content: "Sample message from me", createdAt: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Sample message from chatGPT", createdAt: Date(), sender: .chatGPT),
    ]
}

struct OpenAICompletionsBody: Encodable {
    let model: String
    let prompt: String
    let temperature: Float?
    let max_tokens: Int
}

struct OpenAIResponse: Decodable {
    let id: String
    let choices: [OpenAIResponseChoice]
}

struct OpenAIResponseChoice: Decodable {
    let text: String
}
