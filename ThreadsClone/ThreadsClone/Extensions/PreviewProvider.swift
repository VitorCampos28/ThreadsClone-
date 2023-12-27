//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 15/12/23.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullName: "Francisco Bola", email: "francisco@gmail.com", userName: "franciscoBola")
    
    let thread = Thread(ownerUid: "123", caption: "This is a thread test", timestamp: Timestamp(), likes: 0)
}
