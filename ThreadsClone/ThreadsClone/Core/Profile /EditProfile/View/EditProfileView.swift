//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 08/12/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user: User
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(content: {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea(edges: [.bottom, .horizontal])
                
                VStack(content: {
                    HStack(content: {
                        VStack(alignment: .leading, content: {
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text(user.fullName)
                        })
                        Spacer()
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView(user: user, size: .medium)
                            }
                        }
                    })
                    Divider()
                    
                    VStack(alignment: .leading, content: {
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio.. ", text: $bio, axis: .vertical)
                    })
                    
                    Divider()
                    
                    VStack(alignment: .leading, content: {
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Add link... ", text: $bio)
                    })
                    
                    Divider()
                    
                    Toggle("Private Profile", isOn: $isPrivateProfile)
                })
                .font(.footnote)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                })
                .padding()
            })
            .navigationTitle("Edit Profile")
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
                    Button(action: {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    }, label: {
                        Text("Done")
                    })
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
            })
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: dev.user)
    }
}
