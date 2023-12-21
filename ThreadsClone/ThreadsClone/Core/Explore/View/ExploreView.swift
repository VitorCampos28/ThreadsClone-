//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 05/12/23.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel = ExploreViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(content: {
                    ForEach(viewModel.users) { users in
                        NavigationLink(value: users) {
                            VStack {
                                UserCell(user: users)
                                
                                Divider()
                            }
                            .padding(.vertical, 4)
                        }
                    }
                })
                .navigationDestination(for: User.self, destination: { user in
                    ProfileView(user: user)
                })
                .navigationTitle("Search")
                .searchable(text: $searchText, prompt: "Search")
            }
        }
    }
}

#Preview {
    ExploreView()
}
