//
//  Bottom_AutoHeightPopup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Bottom_AutoHeightPopup: BottomPopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
        }
        .padding(.top, 40)
        .padding(.bottom, 24)
    }
    func configurePopup(config: BottomPopupConfig) -> BottomPopupConfig {
        config.cornerRadius(40)
    }
}

private extension Bottom_AutoHeightPopup {
    func createBrandingContent() -> some View {
        BrandingContent()
    }
}
