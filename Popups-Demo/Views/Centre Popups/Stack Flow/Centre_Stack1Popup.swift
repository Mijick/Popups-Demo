//
//  Centre_Stack1Popup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Centre_Stack1Popup: CentrePopup {
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
    func configurePopup(config: CentrePopupConfig) -> CentrePopupConfig {
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
        PrimaryButton("Dismiss", action: { dismissLastPopup() })
            .changeAppearance(to: .accentedAlternative)
            .setHeight(to: .small)
    }
}

private extension Centre_Stack1Popup {
    func onActionButtonTap() { Centre_Stack2Popup().present() }
}
