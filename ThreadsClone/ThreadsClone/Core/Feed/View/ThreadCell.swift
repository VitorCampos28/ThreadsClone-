//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 05/12/23.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack(content: {
            HStack(alignment: .top, spacing: 12, content: {
                CircularProfileImageView(user: nil, size: .small)
                
                VStack(alignment: .leading, spacing: 4, content: {
                    HStack {
                        Text("maxverstappen1")
                            .font(.footnote)
                        .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button(action: {}, label: {
                                Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        })
                    }
                    
                    Text("Freedom Lover")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16, content: {
                        Button(action: {}, label: {
                            Image(systemName: "heart")
                        })
                        Button(action: {}, label: {
                            Image(systemName: "bubble.right")
                        })
                        Button(action: {}, label: {
                            Image(systemName: "arrow.rectanglepath")
                        })
                        Button(action: {}, label: {
                            Image(systemName: "paperplane")
                        })
                    })
                    .padding(.vertical, 8)
                    .foregroundStyle(.black)
                })
            })
            Divider()
        })
        .padding()
    }
}

#Preview {
    ThreadCell()
}
