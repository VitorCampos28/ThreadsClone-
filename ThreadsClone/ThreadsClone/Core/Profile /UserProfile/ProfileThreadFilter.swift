//
//  ProfileThreadFilter.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 05/12/23.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads:
            return "Threads"
        case .replies:
            return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
