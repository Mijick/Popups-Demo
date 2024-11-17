//
//  Bottom_LargePopup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Bottom_LargePopup: BottomPopup {
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
        config.heightMode(.large)
    }
}
private extension Bottom_LargePopup {
    func createBrandingContent() -> some View {
        BrandingContent()
    }
    func createDismissButton() -> some View {
        PrimaryButton("Dismiss", action: onDismissButtonTap)
            .changeAppearance(to: .accentedAlternative)
    }
}

private extension Bottom_LargePopup {
    func onDismissButtonTap() { Task {
        await dismissLastPopup()
    }}
}
