//
//  Centre_Stack2Popup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Centre_Stack2Popup: CentrePopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
            createText()
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

private extension Centre_Stack2Popup {
    func createBrandingContent() -> some View {
        BrandingContent()
            .hideSocialMedia(true)
            .padding(.bottom, 24)
    }
    func createText() -> some View {
        Text(text)
            .multilineTextAlignment(.center)
            .font(.smallRegular)
            .foregroundStyle(Color.textSecondary)
            .padding(.bottom, 16)
    }
    func createButtons() -> some View {
        HStack(spacing: 8) {
            createActionButton()
            createDismissButton()
        }
    }
}

private extension Centre_Stack2Popup {
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

private extension Centre_Stack2Popup {
    func onActionButtonTap() { }
}

private extension Centre_Stack2Popup {
    var text: String { "Nisi aliquip quis quis exercitation irure exercitation occaecat qui duis nisi. Labore elit duis excepteur et cupidatat qui deserunt ipsum reprehenderit." }
}
