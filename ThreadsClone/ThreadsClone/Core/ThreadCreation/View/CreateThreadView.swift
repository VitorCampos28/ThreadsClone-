//
//  CreateThreadView.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 05/12/23.
//

import SwiftUI

struct CreateThreadView: View {
    @State private var thread = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(content: {
                HStack(alignment: .top, content: {
                    CircularProfileImageView()
                    
                    VStack(alignment: .leading, spacing: 4, content: {
                        Text("maxverstappen1")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread...", text: $thread, axis: .vertical)
                    })
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !thread.isEmpty {
                        Button(action: {
                            thread = ""
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.gray)
                        })
                    }
                })
                Spacer()
            })
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Text("Post")
                    })
                    .opacity(thread.isEmpty ? 0.5 : 1.0)
                    .disabled(thread.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
            })
        }
    }
}

#Preview {
    CreateThreadView()
}
