//
//  User.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 12/12/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    let userName: String
    var profileImageURL: String?
    var bio: String?
}
