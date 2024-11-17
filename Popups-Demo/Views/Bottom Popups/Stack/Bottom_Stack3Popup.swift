//
//  Bottom_Stack3Popup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Bottom_Stack3Popup: BottomPopup {
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
            Spacer()
            createActionButton()
            createDismissButton()
        }
        .padding(.horizontal, 28)
        .padding(.bottom, 8)
        .padding(.top, 40)
    }
    func configurePopup(config: BottomPopupConfig) -> BottomPopupConfig {
        config
            .cornerRadius(40)
            .heightMode(.large)
    }
}
private extension Bottom_Stack3Popup {
    func createBrandingContent() -> some View {
        BrandingContent()
            .padding(.bottom, 138)
    }
    func createActionButton() -> some View {
        PrimaryButton("Present next popup", action: onActionButtonTap)
            .padding(.bottom, 10)
    }
    func createDismissButton() -> some View {
        PrimaryButton("Dismiss", action: onDismissButtonTap)
            .changeAppearance(to: .accentedAlternative)
    }
}

private extension Bottom_Stack3Popup {
    func onActionButtonTap() { Task {
        await Bottom_Stack4Popup().present()
    }}
    func onDismissButtonTap() { Task {
        await dismissLastPopup()
    }}
}
