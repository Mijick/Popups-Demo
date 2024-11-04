//
//  Bottom_NoOverlayPopup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Bottom_NoOverlayPopup: BottomPopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
        }
        .padding(.vertical, 16)
    }
    func configurePopup(config: BottomPopupConfig) -> BottomPopupConfig {
        config
            .cornerRadius(23)
            .ignoreSafeArea(edges: .bottom)
            .popupHorizontalPadding(12)
            .popupBottomPadding(24)
            .overlayColor(.clear)
    }
}

private extension Bottom_NoOverlayPopup {
    func createBrandingContent() -> some View {
        BrandingContent().setAppearance(.compact)
    }
}
