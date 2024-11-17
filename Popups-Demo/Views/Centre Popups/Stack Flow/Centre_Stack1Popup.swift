//
//  Centre_Stack1Popup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Centre_Stack1Popup: CenterPopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
            createActionButton()
            createDismissButton()
        }
        .padding(.horizontal, 32)
        .padding(.top, 28)
        .padding(.bottom, 20)
    }
    func configurePopup(config: CenterPopupConfig) -> CenterPopupConfig {
        config.cornerRadius(20)
    }
}
private extension Centre_Stack1Popup {
    func createBrandingContent() -> some View {
        BrandingContent()
            .hideSocialMedia(true)
            .padding(.bottom, 24)
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

private extension Centre_Stack1Popup {
    func onActionButtonTap() { Task {
        await Centre_Stack2Popup().present()
    }}
    func onDismissButtonTap() { Task {
        await dismissLastPopup()
    }}
}
