//
//  Top_DragDetentPopup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Top_DragDetentPopup: TopPopup {
    var body: some View {
        VStack(spacing: 32) {
            createBrandingContent()
            Spacer()
            createDismissButton()
            createDragIndicator()
        }
        .padding(.horizontal, 28)
        .padding(.top, 32)
        .padding(.bottom, 16)
    }
    func configurePopup(config: TopPopupConfig) -> TopPopupConfig {
        config
            .cornerRadius(24)
            .dragDetents([.fraction(1.4), .fullscreen])
    }
}

private extension Top_DragDetentPopup {
    func createBrandingContent() -> some View {
        BrandingContent()
    }
    func createDismissButton() -> some View {
        PrimaryButton("Dismiss", action: { dismissLastPopup() })
            .changeAppearance(to: .accentedAlternative)
            .setHeight(to: .small)
    }
    func createDragIndicator() -> some View {
        DragIndicator()
    }
}
