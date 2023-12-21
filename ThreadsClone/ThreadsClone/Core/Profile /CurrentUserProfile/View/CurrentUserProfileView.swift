//
//  CurrentUserProfileView.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 18/12/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView() {
                VStack(spacing: 20) {
                    ProfileHeaderView(user: currentUser)
                        .padding(.horizontal)
                    Button(action: {
                        showEditProfile.toggle()
                    }, label: {
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
            .sheet(isPresented: $showEditProfile, content: {
                EditProfileView()
                    .environmentObject(viewModel)
            })
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
