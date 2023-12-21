//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 15/12/23.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullName: "Francisco Bola", email: "francisco@gmail.com", userName: "franciscoBola")
}
