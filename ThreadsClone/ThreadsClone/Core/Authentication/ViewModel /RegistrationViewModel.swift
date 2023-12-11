//
//  RegistrationViewModel.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 11/12/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    @Published var userName = ""
    
    @MainActor
    func creatUser() async throws {
        try await AuthService.shared.createUser(withemail: email,
                                      password: password,
                                      fullName: fullName,
                                      userName: userName)
    }
}
