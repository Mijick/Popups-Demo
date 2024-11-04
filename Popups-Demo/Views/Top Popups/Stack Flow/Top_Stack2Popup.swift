//
//  Top_Stack2Popup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Top_Stack2Popup: TopPopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
            createActionButton()
            createDismissButton()
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 20)
        .padding(.top, 20)
        
    }
    func configurePopup(config: TopPopupConfig) -> TopPopupConfig {
        config
            .cornerRadius(0)
    }
}

private extension Top_Stack2Popup {
    func createBrandingContent() -> some View {
        BrandingContent()
            .setAppearance(.compact)
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

private extension Top_Stack2Popup {
    func onActionButtonTap() { Top_Stack3Popup().present() }
}
