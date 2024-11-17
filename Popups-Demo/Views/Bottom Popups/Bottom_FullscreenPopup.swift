//
//  Bottom_FullscreenPopup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Bottom_FullscreenPopup: BottomPopup {
    var body: some View {
        VStack(spacing: 32) {
            createBrandingContent()
            Spacer()
            createDismissButton()
        }
        .padding(.horizontal, 28)
        .padding(.top, 32)
        .padding(.bottom, 16)
    }
    func configurePopup(config: BottomPopupConfig) -> BottomPopupConfig {
        config.heightMode(.fullscreen)
    }
}
private extension Bottom_FullscreenPopup {
    func createBrandingContent() -> some View {
        BrandingContent()
    }
    func createDismissButton() -> some View {
        PrimaryButton("Dismiss", action: { dismissLastPopup() })
            .changeAppearance(to: .accentedAlternative)
    }
}
