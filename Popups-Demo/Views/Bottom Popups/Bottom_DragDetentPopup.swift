//
//  Bottom_DragDetentPopup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Bottom_DragDetentPopup: BottomPopup {
    var body: some View {
        VStack(spacing: 0) {
            createDragIndicator()
            createBrandingContent()
        }
        .padding(.top, 12)
        .padding(.bottom, 24)
    }
    func configurePopup(config: BottomPopupConfig) -> BottomPopupConfig {
        config
            .cornerRadius(40)
            .dragDetents([.fraction(1.8), .large])
    }
}

private extension Bottom_DragDetentPopup {
    func createDragIndicator() -> some View {
        DragIndicator()
    }
    func createBrandingContent() -> some View {
        BrandingContent()
            .padding(.top, 40)
    }
}
