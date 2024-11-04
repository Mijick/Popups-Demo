//
//  Top_Overlay1Popup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Top_OverlayPopup: TopPopup {
    let step: Step
    
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
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
            .overlayColor(step.overlayColor)
    }
}

private extension Top_OverlayPopup {
    func createBrandingContent() -> some View {
        BrandingContent()
            .padding(.bottom, 32)
    }
    func createActionButton() -> some View {
        PrimaryButton("Present next popup", action: step.presentNext)
            .setHeight(to: .small)
            .padding(.bottom, 8)
    }
    func createDismissButton() -> some View {
        PrimaryButton("Dismiss", action: { dismissLastPopup() })
            .changeAppearance(to: .accentedAlternative)
            .setHeight(to: .small)
    }
}
