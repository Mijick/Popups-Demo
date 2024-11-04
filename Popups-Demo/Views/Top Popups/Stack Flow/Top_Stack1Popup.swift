//
//  Top_Stack1Popup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Top_Stack1Popup: TopPopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
            createActionButton()
            createDismissButton()
        }
        .padding(.horizontal, 28)
        .padding(.bottom, 20)
        .padding(.top, 24)
    }
    func configurePopup(config: TopPopupConfig) -> TopPopupConfig {
        config
            .cornerRadius(20)
            .ignoreSafeArea(edges: .top)
            .popupTopPadding(topPopupPadding)
            .popupHorizontalPadding(12)
    }
}

private extension Top_Stack1Popup {
    func createBrandingContent() -> some View {
        BrandingContent()
            .setAppearance(.compact)
            .padding(.bottom, 20)
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

private extension Top_Stack1Popup {
    func onActionButtonTap() { Top_Stack2Popup().present() }
}

private extension Top_Stack1Popup {
    var topPopupPadding: CGFloat { Screen.safeArea.top + 8 }
}
