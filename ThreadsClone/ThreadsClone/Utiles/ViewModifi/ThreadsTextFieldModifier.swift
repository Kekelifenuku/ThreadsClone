//
//  ThreadsTextFieldModifier.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/17/23.
//

import SwiftUI


struct ThreadsTextFieldModifier: ViewModifier {
    func body (content: Content) -> some View {
        content
            .font (.subheadline)
        .padding (12)
        .background (Color (.systemGray6))
        . cornerRadius(10)
        .padding (.horizontal, 24)
    }
}

