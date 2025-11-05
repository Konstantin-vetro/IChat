//
//  MUser.swift
//  IChat
//
//  Created by Гость on 05.11.2025.
//

import Foundation

struct MUser: Hashable, Decodable {
    let username: String
    let avatarStringURL: String
    let id: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
}
