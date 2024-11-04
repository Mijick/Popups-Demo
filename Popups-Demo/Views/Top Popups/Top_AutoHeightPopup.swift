//
//  Top_AutoHeightPopup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Top_AutoHeightPopup: TopPopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
        }
        .padding(.vertical, 20)
    }
    func configurePopup(config: TopPopupConfig) -> TopPopupConfig {
        config.cornerRadius(0)
    }
}

private extension Top_AutoHeightPopup {
    func createBrandingContent() -> some View {
        BrandingContent()
            .setAppearance(.compact)
    }
}
