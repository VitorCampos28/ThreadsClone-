//
//  ContentView.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        if viewModel.userSession != nil {
            ThreadsTabView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
