//
//  Top_PaddingsPopup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Top_PaddingsPopup: TopPopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
        }
        .padding(.vertical, 20)
        
    }
    func configurePopup(config: TopPopupConfig) -> TopPopupConfig {
        config
            .cornerRadius(20)
            .ignoreSafeArea(edges: .top)
            .popupTopPadding(topPopupPadding)
            .popupHorizontalPadding(12)
    }
}

private extension Top_PaddingsPopup {
    func createBrandingContent() -> some View {
        BrandingContent()
            .setAppearance(.compact)
    }
}

private extension Top_PaddingsPopup {
    var topPopupPadding: CGFloat { Screen.safeArea.top + 8 }
}
