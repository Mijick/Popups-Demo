//
//  BottomPopupView.ViewModel.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 30.10.2024.
//

import SwiftUI
import MijickPopups

extension BottomPopupView {
    class ViewModel: ObservableObject {
        @Published private(set) var outerHorizontalPadding: CGFloat = 0
        @Published private(set) var outerBottomPadding: CGFloat = 0
        @Published private(set) var buttons: [Buttons] = []
        @Published private(set) var dragPoints: [DragDetent] = []
        @Published private(set) var showTextField: Bool = false
        @Published private(set) var showTextView: Bool = false
        @Published private(set) var isAvailableInteractions: Bool = true
        @Published private(set) var cornerRadius: CGFloat = 40
        @Published private(set) var heightMode: HeightMode = .auto
        @Published private(set) var brandingAppearance: BrandingContent.Appearance = .nonCompact
        @Published private(set) var overlayColor: Color = .overlayPrimary
        @Published private(set) var spacerHeight: CGFloat?
    }
}

extension BottomPopupView.ViewModel {
    func setButtons(_ value: [Buttons]) -> Self { buttons = value; return self }
    func setBrandingAppearance(_ value: BrandingContent.Appearance) -> Self { brandingAppearance = value; return self }
    func setHorizontalPaddings(_ value: CGFloat) -> Self { outerHorizontalPadding = value; return self }
    func setBottomPadding(_ value: CGFloat) -> Self { outerBottomPadding = value; return self }
    func setDragPoints(_ value: [DragDetent]) -> Self { dragPoints = value; return self }
    func isShowTextField(_ value: Bool) -> Self { showTextField = value; return self }
    func isShowTextView(_ value: Bool) -> Self { showTextView = value; return self }
    func setHeightMode(_ value: HeightMode) -> Self { heightMode = value; return self }
    func enableInteractions(_ value: Bool) -> Self { isAvailableInteractions = value; return self }
    func setOverlayColor(_ value: Color) -> Self { overlayColor = value; return self }
    func setSpacerHeight(_ value: CGFloat) -> Self { spacerHeight = value; return self }
}

extension BottomPopupView.ViewModel {
    var showSpacer: Bool { spacerHeight != nil || heightMode != .auto || !dragPoints.isEmpty }
    var ignoreSafeArea: Edge.Set { showTextField ? [.bottom] : [] }
    var isActiveDragIndicator: Bool { !dragPoints.isEmpty }
    var isActiveScrolling: Bool { showTextView }
}

extension BottomPopupView.ViewModel {
    var brandingBottomPadding: CGFloat { brandingAppearance == .compact ? 16 : 24 }
    var brandingTopPadding: CGFloat { brandingAppearance == .compact ? 16 : 40 }
    var horizontalPadding: CGFloat { 28 }
}

extension BottomPopupView.ViewModel {
    var text: String { "Consectetur voluptate sint ea ullamco eu ex. Nulla duis fugiat magna. Minim proident labore adipisicing voluptate esse laborum tempor nulla laboris duis magna ea ea anim laborum. Esse do dolore irure tempor et commodo sunt irure. Cupidatat est aliquip aliqua in magna in deserunt officia aute Lorem fugiat cillum do id officia. Anim aliquip esse eu laborum consectetur culpa proident dolore nisi commodo. Duis in incididunt ex id excepteur nostrud." }
}
