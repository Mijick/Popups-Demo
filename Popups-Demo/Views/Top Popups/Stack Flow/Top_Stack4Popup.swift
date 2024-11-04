//
//  Top_Stack4Popup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Top_Stack4Popup: TopPopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
            Spacer()
            createActionButton()
            createDismissButton()
        }
        .padding(.horizontal, 28)
        .padding(.bottom, 16)
        .padding(.top, 32)
    }
    func configurePopup(config: TopPopupConfig) -> TopPopupConfig {
        config
            .cornerRadius(24)
            .heightMode(.large)
    }
}

private extension Top_Stack4Popup {
    func createBrandingContent() -> some View {
        BrandingContent()
    }
    func createActionButton() -> some View {
        PrimaryButton("Present next popup", action: onActionButtonTap)
            .padding(.bottom, 8)
    }
    func createDismissButton() -> some View {
        PrimaryButton("Dismiss", action: { dismissLastPopup() })
            .changeAppearance(to: .accentedAlternative)
    }
}

private extension Top_Stack4Popup {
    func onActionButtonTap() { Top_Stack5Popup().present() }
}
