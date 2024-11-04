//
//  Centre_ResizablePopup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI
import MijickPopups

struct Centre_ResizablePopup: CentrePopup {
    @State private var verticalPaddings: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
            createActionButton()
            createDismissButton()
        }
        .padding(.horizontal, 32)
        .padding(.top, 28)
        .padding(.bottom, 20)
        .padding(.vertical, verticalPaddings)
    }
    func configurePopup(config: CentrePopupConfig) -> CentrePopupConfig {
        config.cornerRadius(20)
    }
}

private extension Centre_ResizablePopup {
    func createBrandingContent() -> some View {
        BrandingContent()
            .hideSocialMedia(true)
            .padding(.bottom, 24)
    }
    func createActionButton() -> some View {
        PrimaryButton("Make popup bigger", action: onActionButtonTap)
            .setHeight(to: .small)
            .padding(.bottom, 8)
    }
    func createDismissButton() -> some View {
        PrimaryButton("Dismiss", action: { dismissLastPopup() })
            .changeAppearance(to: .accentedAlternative)
            .setHeight(to: .small)
    }
}

private extension Centre_ResizablePopup {
    func onActionButtonTap() { verticalPaddings += 60 }
}
