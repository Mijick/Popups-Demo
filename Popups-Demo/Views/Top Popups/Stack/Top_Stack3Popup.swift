//
//  Top_Stack3Popup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Top_Stack3Popup: TopPopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
            createActionButton()
            createDismissButton()
        }
        .padding(.horizontal, 28)
        .padding(.bottom, 16)
        .padding(.top, 32)
    }
    func configurePopup(config: TopPopupConfig) -> TopPopupConfig {
        config.cornerRadius(24)
    }
}

private extension Top_Stack3Popup {
    func createBrandingContent() -> some View {
        BrandingContent()
            .padding(.bottom, 32)
    }
    func createActionButton() -> some View {
        PrimaryButton("Present next popup", action: onActionButtonTap)
            .setHeight(to: .small)
            .padding(.bottom, 8)
    }
    func createDismissButton() -> some View {
        PrimaryButton("Dismiss", action: onDismissButtonTap)
            .changeAppearance(to: .accentedAlternative)
            .setHeight(to: .small)
    }
}

private extension Top_Stack3Popup {
    func onActionButtonTap() { Task {
        await Top_Stack4Popup().present()
    }}
    func onDismissButtonTap() { Task {
        await dismissLastPopup()
    }}
}
