//
//  ProfileHeaderView.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 18/12/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    
    init(user: User? = nil) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack (alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4, content: {
                    Text(user?.fullName ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.userName ?? "")
                        .font(.subheadline)
                })
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("2 followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            
            CircularProfileImageView()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user )
    }
}
