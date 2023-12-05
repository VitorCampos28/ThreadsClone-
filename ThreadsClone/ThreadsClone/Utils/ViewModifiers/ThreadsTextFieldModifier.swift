//
//  ThreadsTextFieldModifier.swift
//  ThreadsClone
//
//  Created by Vitor Campos on 23/11/23.
//

import SwiftUI

struct ThreadsTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
