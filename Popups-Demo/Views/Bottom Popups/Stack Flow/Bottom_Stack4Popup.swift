//
//  Bottom_Stack4Popup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Bottom_Stack4Popup: BottomPopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
            Spacer()
            createDismissButton()
        }
        .padding(.horizontal, 28)
        .padding(.bottom, 8)
        .padding(.top, 40)
    }
    func configurePopup(config: BottomPopupConfig) -> BottomPopupConfig {
        config
            .cornerRadius(40)
            .heightMode(.fullscreen)
    }
}

private extension Bottom_Stack4Popup {
    func createBrandingContent() -> some View {
        BrandingContent()
            .padding(.bottom, 138)
    }
    func createDismissButton() -> some View {
        PrimaryButton("Dismiss", action: { dismissLastPopup() })
            .changeAppearance(to: .accentedAlternative)
    }
}
