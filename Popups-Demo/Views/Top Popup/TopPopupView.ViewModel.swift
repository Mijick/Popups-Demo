//
//  TopPopupView.ViewModel.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 29.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI
import MijickPopups

extension TopPopupView {
    @MainActor class ViewModel: ObservableObject, ClassConfigurable {
        var brandingAppearance: BrandingContent.Appearance = .nonCompact
        var popupHorizontalPadding: CGFloat = 0
        var popupTopPadding: CGFloat = 0
        var buttons: [Buttons] = []
        var overlayColor: Color = .overlayPrimary
        var dragPoints: [DragDetent] = []
        var showTextField: Bool = false
        var buttonHeight: PrimaryButton.Height = .small
        var cornerRadius: CGFloat = 24
        var heightMode: HeightMode = .auto
    }
}

extension TopPopupView.ViewModel {
    func setButtons(_ value: [Buttons]) -> Self { configure(path: \.buttons, value) }
    func setBrandingAppearance(_ value: BrandingContent.Appearance) -> Self {
        configure(path: \.brandingAppearance, value) }
    func setPopupHorizontalPaddings(_ value: CGFloat) -> Self { configure(path: \.popupHorizontalPadding, value) }
    func setPopupTopPadding(_ value: CGFloat) -> Self { configure(path: \.popupTopPadding, value) }
    func setOverlayColor(_ value: Color) -> Self { configure(path: \.overlayColor, value) }
    func setDragPoints(_ value: [DragDetent]) -> Self { configure(path: \.dragPoints, value) }
    func isShowTextField(_ value: Bool) -> Self { configure(path: \.showTextField, value) }
    func setButtonHeight(_ value: PrimaryButton.Height) -> Self { configure(path: \.buttonHeight, value) }
    func setCornerRadius(_ value: CGFloat) -> Self { configure(path: \.cornerRadius, value) }
    func setHeightMode(_ value: HeightMode) -> Self { configure(path: \.heightMode, value) }
}

extension TopPopupView.ViewModel {
    var showSpacer: Bool { heightMode != .auto || !dragPoints.isEmpty }
    var topPadding: CGFloat { brandingAppearance == .compact ? 20 : 32 }
    var bottomPadding: CGFloat { 20 }
    var horizontalPadding: CGFloat { brandingAppearance == .compact ? 16 : 28 }
}
