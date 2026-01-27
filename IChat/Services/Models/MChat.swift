//
//  MChat.swift
//  IChat
//
//  Created by Гость on 05.11.2025.
//

import Foundation

struct MChat: Hashable, Decodable {
    let username: String
    let userImageString: String
    let lastMessage: String
    let id: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
}
