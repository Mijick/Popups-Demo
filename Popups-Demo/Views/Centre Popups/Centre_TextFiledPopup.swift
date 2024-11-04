//
//  Centre_TextFiledPopup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Centre_TextFiledPopup: CentrePopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
            createTextField()
            createButtons()
        }
        .padding(.horizontal, 32)
        .padding(.top, 28)
        .padding(.bottom, 20)
    }
    func configurePopup(config: CentrePopupConfig) -> CentrePopupConfig {
        config.cornerRadius(20)
    }
}

private extension Centre_TextFiledPopup {
    func createBrandingContent() -> some View {
        BrandingContent()
            .hideSocialMedia(true)
            .padding(.bottom, 24)
    }
    func createTextField() -> some View {
        PrimaryTextField()
            .padding(.bottom, 12)
    }
    func createButtons() -> some View {
        HStack(spacing: 8) {
            createActionButton()
            createDismissButton()
        }
    }
}

private extension Centre_TextFiledPopup {
    func createActionButton() -> some View {
        PrimaryButton("Open GitHub", action: onActionButtonTap)
            .setHeight(to: .small)
    }
    func createDismissButton() -> some View {
        PrimaryButton("Dismiss", action: { dismissLastPopup() })
            .changeAppearance(to: .accentedAlternative)
            .setHeight(to: .small)
    }
}

private extension Centre_TextFiledPopup {
    func onActionButtonTap() {
    #if os(macOS)
        NSWorkspace.shared.open(gitHub)
    #else
        UIApplication.shared.open(gitHub)
    #endif
    }
}

private extension Centre_TextFiledPopup {
    var gitHub: URL { URL(string: "https://github.com/Mijick")! }
}
