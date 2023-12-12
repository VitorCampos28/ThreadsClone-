//
//  LoginView.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 23/11/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("ThreadsIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack(content: {
                    TextField("Enter your email", text: $viewModel.email)
                        .textInputAutocapitalization(.none)
                        .modifier(ThreadsTextFieldModifier())
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(ThreadsTextFieldModifier())
                })
                .padding(.horizontal)
                NavigationLink {
                    Text("Forgot password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button(action: {
                    Task {
                        try await viewModel.login()
                    }
                }, label: {
                    Text("Login")
                        .modifier(ThreadsButtonModifier())
                })
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3, content: {
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    })
                    .font(.footnote)
                    .foregroundStyle(.black)
                }
                .padding(.vertical, 16)

                
            }
        }
    }
}

#Preview {
    LoginView()
}
