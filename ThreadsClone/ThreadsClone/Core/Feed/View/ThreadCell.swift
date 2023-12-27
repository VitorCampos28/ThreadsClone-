//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 05/12/23.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    
    var body: some View {
        VStack(content: {
            HStack(alignment: .top, spacing: 12, content: {
                CircularProfileImageView(user: thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4, content: {
                    HStack {
                        Text(thread.user?.userName ?? "")
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
                    
                    Text(thread.caption)
                        .font(.caption)
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

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell(thread: dev.thread)
    }
}
