//
//  Top_FullscreenPopup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Top_FullscreenPopup: TopPopup {
    var body: some View {
        VStack(spacing: 32) {
            createBrandingContent()
            Spacer()
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
private extension Top_FullscreenPopup {
    func createBrandingContent() -> some View {
        BrandingContent()
    }
    func createDismissButton() -> some View {
        PrimaryButton("Dismiss", action: onDismissButtonTap)
            .changeAppearance(to: .accentedAlternative)
    }
}

private extension Top_FullscreenPopup {
    func onDismissButtonTap() { Task {
        await dismissLastPopup()
    }}
}
