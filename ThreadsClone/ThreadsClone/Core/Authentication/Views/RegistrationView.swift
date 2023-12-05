//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 23/11/23.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var userName = ""

    
    var body: some View {
        VStack {
            Spacer()
            
            Image("ThreadsIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack(content: {
                TextField("Enter your email", text: $email)
                    .textInputAutocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                
                SecureField("Enter your password", text: $password)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your full name", text: $fullName)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your username", text: $userName)
                    .modifier(ThreadsTextFieldModifier())
            })
            .padding(.horizontal)
            
            Button(action: {}, label: {
                Text("Sign Up")
                    .modifier(ThreadsButtonModifier())
            })
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button(action: {dismiss()}, label: {
                HStack(spacing: 3, content: {
                    Text("Already have an account?")
                    
                    Text("Sign in")
                        .fontWeight(.semibold)
                })
                .font(.footnote)
                .foregroundStyle(.black)
            })
            .padding(.vertical)
        }
    }
}

#Preview {
    RegistrationView()
}
