//
//  CurrentUserProfileView.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 18/12/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView() {
                VStack(spacing: 20) {
                    ProfileHeaderView(user: currentUser)
                        .padding(.horizontal)
                    Button(action: {}, label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    })
                    // user content list view
                    UserContentListView()
                }
            }
            .scrollIndicators(.never)
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
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
