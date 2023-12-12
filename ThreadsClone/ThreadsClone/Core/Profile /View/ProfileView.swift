//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 05/12/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        VStack (alignment: .leading, spacing: 12) {
                            VStack(alignment: .leading, spacing: 4, content: {
                                Text("Charles Leclerc")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text("charles_leclerc")
                                    .font(.subheadline)
                            })
                            
                            Text("Formula 1 driver for Scuderia Ferrari")
                                .font(.footnote)
                            
                            Text("2 followers")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        
                        CircularProfileImageView()
                    }
                    
                    Button(action: {}, label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 352, height: 32)
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    
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
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }

                }
            })
            .padding()
        }
    }
}

#Preview {
    ProfileView()
}
