//
//  Bottom_AutoDismissPopup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Bottom_AutoDismissPopup: BottomPopup {
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
            .tapOutsideToDismissPopup(false)
            .enableDragGesture(false)
    }
}

private extension Bottom_AutoDismissPopup {
    func createBrandingContent() -> some View {
        BrandingContent().setAppearance(.compact)
    }
}
