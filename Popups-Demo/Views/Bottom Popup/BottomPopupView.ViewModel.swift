//
//  BottomPopupView.ViewModel.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 30.10.2024.
//

import SwiftUI
import MijickPopups

extension BottomPopupView {
    class ViewModel: ObservableObject, ClassConfigurable {
        var popupHorizontalPadding: CGFloat = 0
        var popupBottomPadding: CGFloat = 0
        var buttons: [Buttons] = []
        var dragPoints: [DragDetent] = []
        var showTextField: Bool = false
        var showTextView: Bool = false
        var isAvailableInteractions: Bool = true
        var cornerRadius: CGFloat = 40
        var heightMode: HeightMode = .auto
        var brandingAppearance: BrandingContent.Appearance = .nonCompact
        var overlayColor: Color = .overlayPrimary
        var spacerHeight: CGFloat?
        var customHeight: CGFloat?
    }
}

extension BottomPopupView.ViewModel {
    func setButtons(_ value: [Buttons]) -> Self { configure(path: \.buttons, value) }
    func setBrandingAppearance(_ value: BrandingContent.Appearance) -> Self { configure(path: \.brandingAppearance, value) }
    func setHorizontalPaddings(_ value: CGFloat) -> Self { configure(path: \.popupHorizontalPadding, value) }
    func setBottomPadding(_ value: CGFloat) -> Self { configure(path: \.popupBottomPadding, value) }
    func setDragPoints(_ value: [DragDetent]) -> Self { configure(path: \.dragPoints, value) }
    func isShowTextField(_ value: Bool) -> Self { configure(path: \.showTextField, value) }
    func isShowTextView(_ value: Bool) -> Self { configure(path: \.showTextView, value) }
    func enableInteractions(_ value: Bool) -> Self { configure(path: \.isAvailableInteractions, value) }
    func setOverlayColor(_ value: Color) -> Self { configure(path: \.overlayColor, value) }
    func setSpacerHeight(_ value: CGFloat) -> Self { configure(path: \.spacerHeight, value) }
    func setHeightMode(_ value: HeightMode) -> Self { configure(path: \.heightMode, value) }
    func setHeight(_ value: CGFloat?) -> Self { configure(path: \.customHeight, value) }
    func setCornerRadius(_ value: CGFloat) -> Self { configure(path: \.cornerRadius, value) }
}

extension BottomPopupView.ViewModel {
    var showSpacer: Bool { spacerHeight != nil || heightMode != .auto || !dragPoints.isEmpty }
    var ignoreSafeArea: Edge.Set { showTextView || brandingAppearance == .compact ? [.bottom] : [] }
    var isActiveDragIndicator: Bool { !dragPoints.isEmpty }
    var isActiveScrolling: Bool { showTextView }
    var isAvailableDragGesture: Bool { !showTextView && isAvailableInteractions }
}

extension BottomPopupView.ViewModel {
    var brandingBottomPadding: CGFloat { brandingAppearance == .compact ? 16 : 24 }
    var brandingTopPadding: CGFloat { brandingAppearance == .compact ? 16 : 40 }
    var horizontalPadding: CGFloat { 28 }
}

extension BottomPopupView.ViewModel {
    var text: String { "Consectetur voluptate sint ea ullamco eu ex. Nulla duis fugiat magna. Minim proident labore adipisicing voluptate esse laborum tempor nulla laboris duis magna ea ea anim laborum. Esse do dolore irure tempor et commodo sunt irure. Cupidatat est aliquip aliqua in magna in deserunt officia aute Lorem fugiat cillum do id officia. Anim aliquip esse eu laborum consectetur culpa proident dolore nisi commodo. Duis in incididunt ex id excepteur nostrud. Consectetur voluptate sint ea ullamco eu ex. Nulla duis fugiat magna. Minim proident labore adipisicing voluptate esse laborum tempor nulla laboris duis magna ea ea anim laborum. Esse do dolore irure tempor et commodo sunt irure. Cupidatat est aliquip aliqua in magna in deserunt officia aute Lorem fugiat cillum do id officia. Anim aliquip esse eu laborum consectetur culpa proident dolore nisi commodo. Duis in incididunt ex id excepteur nostrud. Consectetur voluptate sint ea ullamco eu ex. Nulla duis fugiat magna. Minim proident labore adipisicing voluptate esse laborum tempor nulla laboris duis magna ea ea anim laborum. Esse do dolore irure tempor et commodo sunt irure. Cupidatat est aliquip aliqua in magna in deserunt officia aute Lorem fugiat cillum do id officia. Anim aliquip esse eu laborum consectetur culpa proident dolore nisi commodo. Duis in incididunt ex id excepteur nostrud." }
}
