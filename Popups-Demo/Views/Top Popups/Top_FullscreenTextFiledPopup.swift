//
//  Top_FullscreenTextFiledPopup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Top_FullscreenTextFiledPopup: TopPopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
            Spacer()
            createTextField()
            createDismissButton()
        }
        .padding(.horizontal, 28)
        .padding(.top, 52)
        .padding(.bottom, 8)
    }
    func configurePopup(config: TopPopupConfig) -> TopPopupConfig {
        config
            .heightMode(.fullscreen)
    }
}

private extension Top_FullscreenTextFiledPopup {
    func createBrandingContent() -> some View {
        BrandingContent()
    }
    func createTextField() -> some View {
        PrimaryTextField()
            .padding(.bottom, 12)
    }
    func createDismissButton() -> some View {
        PrimaryButton("Dismiss", action: { dismissLastPopup() })
            .changeAppearance(to: .accentedAlternative)
    }
}
