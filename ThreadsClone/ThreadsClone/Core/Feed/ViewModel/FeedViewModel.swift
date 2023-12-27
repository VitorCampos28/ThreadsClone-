//
//  FeedViewModel.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 27/12/23.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    init() {
        Task { try await fetchThreads()}
    }
    
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreds()
        try await fetchUserDataForThreads()
    }
    
    private func fetchUserDataForThreads() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let threadUser = try await UserService.fetchUser(with: ownerUid)
            
            threads[i].user = threadUser
        }
    }
}
