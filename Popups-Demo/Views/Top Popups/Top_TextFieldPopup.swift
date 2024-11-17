//
//  Top_TextFieldPopup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Top_TextFieldPopup: TopPopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
            createTextfield()
            createDismissButton()
        }
        .padding(.horizontal, 28)
        .padding(.top, 32)
        .padding(.bottom, 20)
    }
    func configurePopup(config: TopPopupConfig) -> TopPopupConfig {
        config.cornerRadius(20)
    }
}
private extension Top_TextFieldPopup {
    func createBrandingContent() -> some View {
        BrandingContent()
            .padding(.bottom, 44)
    }
    func createTextfield() -> some View {
        PrimaryTextField()
            .padding(.bottom, 12)
    }
    func createDismissButton() -> some View {
        PrimaryButton("Dismiss", action: onDismissButtonTap)
            .changeAppearance(to: .accentedAlternative)
    }
}

private extension Top_TextFieldPopup {
    func onDismissButtonTap() { Task {
        await dismissLastPopup()
    }}
}
