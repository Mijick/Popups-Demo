//
//  Top_OverlayPopup.Step .swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI

extension Top_OverlayPopup {
    enum Step { case blue, green, purple }
}

extension Top_OverlayPopup.Step {
    @MainActor var overlayColor: Color {
        switch self {
            case .blue: .overlayBlue
            case .green: .overlayGreen
            case .purple: .overlayPurple
        }
    }
}

extension Top_OverlayPopup.Step {
    @MainActor func presentNext() {
        switch self {
            case .blue: presentGreenPopup()
            case .green: presentPurplePopup()
            case .purple: break
        }
    }
}

private extension Top_OverlayPopup.Step {
    @MainActor func presentGreenPopup() { Task {
        await Top_OverlayPopup(step: .green)
            .setCustomID("Top_GreenOverlayPopup")
            .present()
    }}
    @MainActor func presentPurplePopup() { Task {
        await Top_OverlayPopup(step: .purple)
            .setCustomID("Top_PurpleOverlayPopup")
            .present()
    }}
}
