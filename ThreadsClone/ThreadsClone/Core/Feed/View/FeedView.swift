//
//  FeedView.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 05/12/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false, content: {
                LazyVStack(content: {
                    ForEach(1...10, id: \.self) { thread in
                        ThreadCell()
                    }
                })
            })
            .refreshable {
                print("DEBUG: refresh threads")
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {}, label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundStyle(.black)
                })
            }
        })
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
