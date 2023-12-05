//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 05/12/23.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(content: {
                    ForEach(1...10, id: \.self) { count in
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
