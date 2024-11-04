//
//  Bottom_TextFieldPopup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Bottom_TextFieldPopup: BottomPopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
            createTextField()
            createDismissButton()
        }
        .padding(.horizontal, 28)
        .padding(.top, 40)
        .padding(.bottom, 8)
    }
    func configurePopup(config: BottomPopupConfig) -> BottomPopupConfig {
        config.cornerRadius(40)
    }
}

private extension Bottom_TextFieldPopup {
    func createBrandingContent() -> some View {
        BrandingContent()
            .padding(.bottom, 44)
    }
    func createTextField() -> some View {
        PrimaryTextField()
            .padding(.bottom, 8)
    }
    func createDismissButton() -> some View {
        PrimaryButton("Dismiss", action: { dismissLastPopup() })
            .changeAppearance(to: .accentedAlternative)
    }
}
