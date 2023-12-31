//
//  Thread.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 27/12/23.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadId ?? UUID().uuidString
    }
    var user: User?
}
