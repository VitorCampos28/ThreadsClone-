//
//  UserContentListView.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 18/12/23.
//

import SwiftUI

struct UserContentListView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    var body: some View {
        VStack(content: {
            HStack(content: {
                ForEach(ProfileThreadFilter.allCases) { filter in
                    VStack(content: {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        
                        if selectedFilter == filter {
                            Rectangle()
                                .foregroundStyle(.black)
                                .frame(width: filterBarWidth, height: 1)
                                .matchedGeometryEffect(id: "Item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .frame(width: filterBarWidth, height: 1)
                        }
                    })
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedFilter = filter
                        }
                    }
                }
            })
            
            LazyVStack(content: {
                ForEach(1...10, id: \.self) { count in
                    ThreadCell()
                }
            })
        })
        .padding(.vertical, 8)
    }
}

#Preview {
    UserContentListView()
}
