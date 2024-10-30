//
//  TopPopupView.ViewModel.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 29.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI
import MijickPopups

extension TopPopupView {
    @MainActor class ViewModel: ObservableObject, Configurable {
        @Published private(set) var brandingAppearance: BrandingContent.Appearance = .nonCompact
        @Published private(set) var outerHorizontalPadding: CGFloat = 0
        @Published private(set) var outerTopPadding: CGFloat = 0
        @Published private(set) var buttons: [Buttons] = []
        @Published private(set) var overlayColor: Color = .overlayPrimary
        @Published private(set) var dragPoints: [DragDetent] = []
        @Published private(set) var showTextField: Bool = false
        @Published private(set) var buttonHeight: PrimaryButton.Height = .small
        @Published private(set) var cornerRadius: CGFloat = 24
        @Published private(set) var heightMode: HeightMode = .auto
    }
}

extension TopPopupView.ViewModel {
    func setButtons(_ value: [Buttons]) -> Self { buttons = value; return self }
    func setBrandingAppearance(_ value: BrandingContent.Appearance) -> Self { brandingAppearance = value; return self }
    func setHorizontalPaddings(_ value: CGFloat) -> Self { outerHorizontalPadding = value; return self }
    func setTopPadding(_ value: CGFloat) -> Self { outerTopPadding = value; return self }
    func setOverlayColor(_ value: Color) -> Self { overlayColor = value; return self }
    func setDragPoints(_ value: [DragDetent]) -> Self { dragPoints = value; return self }
    func isShowTextField(_ value: Bool) -> Self { showTextField = value; return self  }
    func setButtonHeight(_ value: PrimaryButton.Height) -> Self { buttonHeight = value; return self }
    func setCornerRadius(_ value: CGFloat) -> Self { cornerRadius = value; return self }
    func setHeightMode(_ value: HeightMode) -> Self { heightMode = value; return self }
}

extension TopPopupView.ViewModel {
    var showSpacer: Bool { heightMode != .auto || !dragPoints.isEmpty }
    var topPadding: CGFloat { brandingAppearance == .compact ? 20 : 32 }
    var bottomPadding: CGFloat { 20 }
    var horizontalPadding: CGFloat { brandingAppearance == .compact ? 16 : 28 }
}
