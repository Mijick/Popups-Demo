//
//  Bottom_Stack2Popup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Bottom_Stack2Popup: BottomPopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
            createActionButton()
            createDismissButton()
        }
        .padding(.horizontal, 28)
        .padding(.bottom, 8)
        .padding(.top, 40)
    }
    func configurePopup(config: BottomPopupConfig) -> BottomPopupConfig {
        config.cornerRadius(40)
    }
}

private extension Bottom_Stack2Popup {
    func createBrandingContent() -> some View {
        BrandingContent()
            .padding(.bottom, 138)
    }
    func createActionButton() -> some View {
        PrimaryButton("Present next popup", action: onActionButtonTap)
            .padding(.bottom, 10)
    }
    func createDismissButton() -> some View {
        PrimaryButton("Dismiss", action: { dismissLastPopup() })
            .changeAppearance(to: .accentedAlternative)
    }
}

private extension Bottom_Stack2Popup {
    func onActionButtonTap() { Bottom_Stack3Popup().present() }
}
