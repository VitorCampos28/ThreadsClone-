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
                    ForEach(viewModel.users) { count in
                        VStack {
                            UserCell()
                            
                            Divider()
                        }
                        .padding(.vertical, 4)
                    }
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
