//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 11/12/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withemail: email, password: password)
    }
}
